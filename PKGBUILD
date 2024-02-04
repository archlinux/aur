# Maintainer: Mark Collins <tera_1225 hat hotmail δot com>

pkgname=mautrix-meta
_name=meta
pkgver=r96.ee8c84d
pkgrel=1
pkgdesc="A Matrix-WhatsApp puppeting bridge"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
# mautrix-meta can be build without encription support.
# For that libolm has to be removed from the makedepends and depends
makedepends=(
  go
  git # waiting for first release to make it non-git dependent
)
depends=(
  glibc
  libolm
)
optdepends=('ffmpeg: If you want to send gifs from Matrix')
url="https://github.com/mautrix/meta"
source=("${_name}::git+${url}"
        sysusers-mautrix-meta.conf
        mautrix-meta.tmpfiles
        mautrix-meta.service
        log-path.diff)
backup=("etc/${pkgname}/mautrix-meta.yaml")
sha256sums=('SKIP'
            '6888d152b7b6b0175160a452009b866eba53244ff844da9f6abeb02654e28be5'
            '7dfa012f34ec7f940b1c4111de701b97273b1c2f4075b2f5e67a4c2327f8fb2f'
            '221814dbeab867bcb5217e22cbdd2d4ba0031ac594bea5a79134f137ef302d22'
            '7dc76380ffd9541f4508e834f32c51766505ac9bc285525063b3336c304967ca')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_name"
  patch -Np1 < "$srcdir/log-path.diff"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
}

package() {
  cd "${srcdir}/$_name"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/sysusers-mautrix-meta.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-meta.conf"
  install -Dm644 "$srcdir/mautrix-meta.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-meta.conf"

  install -Dm644 "example-config.yaml" "$pkgdir/etc/$pkgname/mautrix-meta.yaml"
  install -Dm644 "$srcdir/mautrix-meta.service" "$pkgdir/usr/lib/systemd/system/mautrix-meta.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_full_name/LICENSE"
}
