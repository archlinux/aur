# Maintainer: bko <aur at bil dot co dot ua>

pkgname=pgadmin4-server
pkgver=9.10
pkgrel=1
pkgdesc='The core server package for pgAdmin. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.'
arch=('x86_64')
license=('PostgreSQL')
url='https://www.pgadmin.org/'
depends=('postgresql-libs' 'krb5' 'python-dbus')
makedepends=("python" "python-pip" "postgresql-libs" "gcc" "nodejs" "corepack" "pkgconf" "cmake" "dbus" "npm" "wget" "unzip" "syft" "patch")
provides=('pgadmin4-server')
source=("pgadmin4-${pkgver}.tar.gz::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v${pkgver}/source/pgadmin4-${pkgver}.tar.gz" "server.patch")
sha256sums=('479b7b34b25be53b28174d3b688cebf91869204bec75752e06f7de1634c41507' 'd276423ab3eaa7abaf14e720c51f49cc18a528d2e1b6324d4d05257d5d58f556')

prepare() {
  cd "$srcdir/pgadmin4-${pkgver}"
  patch -p1 <"../server.patch"
}

build() {
  cd "$srcdir/pgadmin4-${pkgver}"

  export COREPACK_HOME="$srcdir/corepack_home"
  mkdir -p "$COREPACK_HOME/bin"
  corepack enable --install-directory "$COREPACK_HOME/bin"
  export PATH="$COREPACK_HOME/bin:$PATH"
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  corepack prepare yarn@stable --activate

  pushd . && cd web
  yarn install && yarn run bundle
  popd
  python -m venv venv
  venv/bin/python3 -m pip install --no-cache-dir -r requirements.txt
  venv/bin/python3 -m pip install --no-cache-dir sphinx sphinxcontrib-youtube
  source venv/bin/activate

  export PYTHONDONTWRITEBYTECODE=1

  source pkg/linux/build-functions.sh

  _setup_env "${PWD}/pkg/linux/DUMMY" "arch"
  _cleanup "pkg.tar.zst"
  _setup_dirs
  _create_python_virtualenv "arch"
  _build_docs "arch"
  _copy_code "arch"
  _generate_sbom
}

package() {
  cp -r "${srcdir}/pgadmin4-${pkgver}/arch-build/server/usr"  "${pkgdir}/"

  # Install license
  install -Dm644 "$srcdir/pgadmin4-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
