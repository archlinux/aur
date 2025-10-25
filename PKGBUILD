# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=kzsh-git
pkgver=0.1.2.f893b2f  # placeholder for current commit version
pkgrel=1
pkgdesc="Kuznix Shell (kzsh) — a bash-like shell written in C and C++, latest development version"
arch=('x86_64')
url="https://github.com/KuznixTeam/kzsh"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'meson' 'ninja' 'gcc' 'pkgconf')
conflicts=('kzsh' 'kzsh-bin')
provides=('kzsh')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

# Dynamically set version based on latest tag and commit
pkgver() {
  cd "${srcdir}/${pkgname}"
  local ver_tag commit
  # Strip leading 'v' from tag and any whitespace
  ver_tag=$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//; s/ //g')
  commit=$(git rev-parse --short HEAD)
  echo "${ver_tag}.${commit}"  # dot separator
}

build() {
  cd "${srcdir}/${pkgname}"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" meson install -C build
}
