# Maintainer: cvnb <narendrabharathi@gmail.com>
pkgname=gerbil-scheme-git
_pkgname=gerbil
pkgver=v0.18.1
pkgrel=1
pkgdesc="Gerbil is an opinionated dialect of Scheme designed for Systems Programming, with a state of the art macro and module system on top of the Gambit runtime."
arch=(x86_64 i686)
url="https://cons.io"
source=("git+https://github.com/mighty-gerbils/gerbil.git")
sha1sums=("SKIP")
license=('LGPLv2.1' 'Apache 2.0')
depends=('openssl' 'zlib' 'sqlite')
makedepends=('git')
provides=("gerbil-scheme")
conflicts=("gerbil-scheme")

# Use git describe to derive the version as is done by upstream. See 
# ./configure:60, gerbil_version. pkgver() derived will contain
# hyphens. Since pkgver cannot contain hyphens, substitute - with _
pkgver() {
  cd "$_pkgname"
  git describe --tags --always | sed 's/-/_/g'
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/opt/gerbil
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR=${pkgdir} install

  mkdir -p ${pkgdir}/etc/profile.d/
  cat <<'EOF' > ${pkgdir}/etc/profile.d/gerbil-scheme.sh
export PATH=/opt/gerbil/bin:$PATH
EOF
}

# vim:set ts=2 sw=2 et:
