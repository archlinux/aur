# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgbase=attune
pkgname=(
  'attune-cli'
  'attune-controlplane'
)
pkgver=0.1.1
pkgrel=1
pkgdesc='Tool for publishing and hosting Linux packages'
arch=('x86_64')
url='https://github.com/attunehq/attune'
license=('Apache-2.0')
makedepends=('bzip2' 'cargo' 'go' 'postgresql')
checkdepends=('coreutils' 'procps-ng' 'openbsd-netcat' 'pifpaf' 'postgresql')
options=('!lto')

source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/attunehq/attune/archive/v${pkgver}.tar.gz"
  'attune-controlplane.service'
)

sha512sums=('6661e50a18f9bd71c0fc5e92e3c4d8551c9e088d5068748fd82ea3bdf153634914015de62e42234421a0b40776a8fcf1017450cd9b37cd808eb22c53c3c3f260'
            '47babf31ba8cb3fbd15d04d8494a62596aad4ac7ebd17bab66f4af7eaf70af7f07e37bc345fa2d45693d81780f6d0bd37187feb85c042ebe6404ca40d8e2e3fd')

prepare() {
  cd "${pkgbase}-${pkgver}"
  mkdir -p cli/build

  echo >&2 'Stripping configuration file'
  awk > 'attune-controlplane.env' \
    -e '/environment variables used by the CLI/ { exit }' \
    -e '{ print }' \
    '.env.example'

  echo >&2 'Downloading dependencies'
  export RUSTUP_TOOLCHAIN=stable
  env -C controlplane cargo fetch \
    --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgbase}-${pkgver}"

  echo >&2 'Building the CLI'
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  env -C cli go build -o build ./cmd/attune

  echo >&2 'Building the control plane'
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  env -C controlplane cargo build --frozen --release --all-features
}

check() {
  cd "${pkgbase}-${pkgver}"

  echo >&2 'Testing the control plane'
  export RUSTUP_TOOLCHAIN=stable
  env -C controlplane cargo test --frozen --all-features

  echo >&2 'Spawning a database instance for the control plane'
  #shellcheck disable=SC2046  # Word splitting is what we actually want
  eval $(pifpaf run postgresql --host localhost)
  #shellcheck disable=SC2016  # Expansion not intended
  timeout 30 bash -c 'until nc -z localhost ${PGPORT?}; do sleep 0.5; done'

  echo >&2 'Initializing the database'
  psql -v ON_ERROR_STOP=1 -f controlplane/migrations/*_init.sql

  echo >&2 'Spawning the control plane'
  ATTUNE_SECRET=attune \
    ATTUNE_DATABASE_URL="${PIFPAF_POSTGRESQL_URL?}" \
    controlplane/target/release/attune-controlplane &
  timeout 30 bash -c 'until nc -z localhost 3000; do sleep 0.5; done'

  echo >&2 'Testing the CLI'
  ATTUNE_API_ENDPOINT=http://localhost:3000 \
    cli/build/attune repo create -d sid -u 'http://localhost' \
    > actual.txt || true
  if ! grep -qF 'Created new repository:' actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi

  echo >&2 'Stopping the control plane'
  pkill -f controlplane/target/release/attune-controlplane || true

  echo >&2 'Stopping the database'
  pifpaf_stop || true
}

# shellcheck disable=SC2128
package_attune-cli() {
  pkgdesc='Command-line tool for publishing and hosting Linux packages'
  depends=('glibc')
  optdepends=('attune-controlplane: manage S3 buckets that contain repositories')

  cd "${pkgbase}-${pkgver}"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" 'cli/build/attune'

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/user-guide/README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}

# shellcheck disable=SC2128
package_attune-controlplane() {
  pkgdesc='Control plane for publishing and hosting Linux packages'
  depends=('bzip2' 'gcc-libs' 'glibc' 'postgresql')
  optdepends=('minio: S3-compatible backend to host packages locally')
  install='attune-controlplane.install'

  cd "${pkgbase}-${pkgver}"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" \
    'controlplane/target/release/attune-controlplane'

  echo >&2 'Packaging configuration'
  install -D -m 644 -T 'attune-controlplane.env' \
    "${pkgdir}/etc/default/attune-controlplane"
  install -d -m 755 "${pkgdir}/etc/attune-controlplane.d"

  echo >&2 'Packaging migration scripts'
  install -d -m 755 "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    controlplane/migrations

  echo >&2 'Packaging the systemd unit file'
  install -D -m 755 -t "${pkgdir}/usr/lib/systemd/system" \
    '../attune-controlplane.service'

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/user-guide/README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
