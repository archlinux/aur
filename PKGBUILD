# Maintainer: Danilo Kuehn <dk at nogo-software dot de>
# Git: https://github.com/nogo/archlinux-pkgbuild
# Brackets v0.34

_shell=brackets-shell
_shell_version=jasonsanjose/cef_2171_linux
_brackets=brackets
_brackets_version=1.3
_version_prefix=release-

# Package
pkgname=brackets-git
pkgver=1.3
pkgrel=1
pkgdesc="Adobe Brackets - An open source code editor for the web, written in JavaScript, HTML and CSS."
arch=("i686" "x86_64")
url="http://brackets.io"
license=("MIT")
depends=("gconf" "libgcrypt15" "nodejs" "npm" "libudev.so.0" "nspr" "nss")
optdepends=("chromium: for live view" "google-chrome: for live view")
makedepends=("git" "p7zip" "gyp-git")
provides=("brackets" "adobe-brackets")
conflicts=('brackets' 'brackets-bin')
install=${pkgname}.install
source=("${_shell}::git+https://github.com/adobe/brackets-shell.git"
        "${_brackets}::git+https://github.com/adobe/brackets.git")
md5sums=("SKIP"
         "SKIP")

pkgver() {
  if [[ -z "${_brackets_version}" ]]; then  
    cd ${srcdir}/${_brackets}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  else
    echo ${_brackets_version}
  fi
}

prepare() {
  if [[ -n "${_shell_version}" ]]; then
    cd ${srcdir}/${_shell}
    git checkout "${_shell_version}"
  fi

  cd ${srcdir}/${_brackets}
  if [[ -n "${_brackets_version}" ]]; then
    git checkout "${_version_prefix}${_brackets_version}"
  fi
  git submodule update --init --recursive
}

build() {
  cd ${srcdir}/${_shell}
  npm install
  node_modules/grunt-cli/bin/grunt setup
  make
}

package() {
  cd ${srcdir}/${_shell}
 
  msg2 "  -> Installing program..." 
  install -dm755 "${pkgdir}/opt/brackets"
  cp -R out/Release/lib "${pkgdir}/opt/brackets/lib"
  cp -R out/Release/locales "${pkgdir}/opt/brackets/locales"
  cp -R out/Release/node-core "${pkgdir}/opt/brackets/node-core"
  install -Dm644 out/Release/cef.pak "${pkgdir}/opt/brackets/cef.pak"
  install -Dm644 out/Release/cef_100_percent.pak "${pkgdir}/opt/brackets/cef_100_percent.pak"
  install -Dm644 out/Release/cef_200_percent.pak "${pkgdir}/opt/brackets/cef_200_percent.pak"
  install -Dm644 out/Release/devtools_resources.pak "${pkgdir}/opt/brackets/devtools_resources.pak"
  install -Dm644 out/Release/icudtl.dat "${pkgdir}/opt/brackets/icudtl.dat"
  install -Dm755 out/Release/Brackets "${pkgdir}/opt/brackets/Brackets"
  install -Dm755 out/Release/Brackets-node "${pkgdir}/opt/brackets/Brackets-node"
  install -Dm755 installer/linux/debian/brackets "${pkgdir}/opt/brackets/brackets"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/brackets/brackets "$pkgdir/usr/bin/brackets"

  msg2 "  -> Installing icons and license..." 
  install -dm755 "${pkgdir}/usr/share"
  install -Dm644 installer/linux/debian/brackets.desktop "${pkgdir}/usr/share/applications/brackets.desktop"
  install -Dm755 installer/linux/debian/package-root/usr/share/doc/brackets/copyright ${pkgdir}/usr/share/licenses/brackets/copyright
  install -Dm644 installer/linux/debian/package-root/usr/share/icons/hicolor/scalable/apps/brackets.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/brackets.svg"
  for size in 32 48 128 256; do
    install -Dm644 "out/Release/appshell${size}.png" "${pkgdir}/opt/brackets/appshell${size}.png"
    install -Dm644 "out/Release/appshell${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/brackets.png"
  done
  
  cd ${srcdir}/${_brackets}
  msg2 "  -> Installing samples..."
  cp -R "samples" "${pkgdir}/opt/brackets/samples"
  cp -R "src" "${pkgdir}/opt/brackets/www"
}
