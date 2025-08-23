# Maintainer:

_pkgname="moltengamepad"
pkgbase="$_pkgname-git"
pkgname=(
  "$pkgbase"
  "$_pkgname-sysuser-git"
)
pkgver=1.2.3.r32.gccf1278
pkgrel=1
pkgdesc="Flexible input device translator, geared for gamepads"
url="https://github.com/ForkingField/MoltenGamepad"
license=('MIT')
arch=('x86_64')

makedepends=(
  'go-md2man'
  'git'
  'meson'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  local _meson_args=(
    -Dlicense_dir="share/licenses/$pkgbase"
  )

  arch-meson "${_meson_args[@]}" "$_pkgsrc" build
  meson compile -C build
}

package_moltengamepad-git() {
  depends=(
    'systemd-libs'
  )

  if [ "${_use_sodeps}" == "t" ]; then
    eval "depends+=('libudev.so')"
  fi

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  meson install -C build --destdir "$pkgdir" --tags bin,config_files,man,seat,licenses
}

package_moltengamepad-sysuser-git() {
  depends=("$pkgbase")

  provides=("$_pkgname-sysuser")
  conflicts=("$_pkgname-sysuser")

  meson install -C build --destdir "$pkgdir" --tags sysuser
}
