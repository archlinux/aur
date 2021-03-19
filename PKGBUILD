# Maintainer: HeyCitizen <4637290+InTheMorning@users.noreply.github.com>
## LICENSE - GPLv3 no later option. Ignore any references to later versions 

_pkgname=gensystray
_install_dir="/usr/share/${_pkgname}/"
pkgname=${_pkgname}-git
pkgver=r25.fd5a9b7
pkgrel=4
pkgdesc='Create your own system tray item to run your favorite commands.'
arch=('x86_64')
url='https://github.com/dardevelin/gensystray'
license=('GPL3')
depends=('gtk3' 'sdl2')
makedepends=('gcc' 'git' 'pkgconf')
provides=('gensystray')
conflicts=('gensystray')
source=("${_pkgname}::git+https://github.com/dardevelin/gensystray.git"
        'gensystray.sample.cfg')
sha256sums=('SKIP'
            '5a53085fa539a3ca6159da6258d58c0637b0f20e0588f81ffab266d3f5637714')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
  $(cat build_gcc.sh|tr -d '\n') $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  mkdir -p "${pkgdir}${_install_dir}"
	cd "${_pkgname}"
	install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m644 "gensystray_default.png" "${pkgdir}/usr/share/icons/${_pkgname}_default.png"
  install -D -m644 "README.md" "${pkgdir}${_install_dir}README.md"
  install -D -m644 "../gensystray.sample.cfg" "${pkgdir}${_install_dir}${_pkgname}.sample.cfg"
  # show configuration notes to the user 
  _ylo="\e[1;33m"
  _rd="\e[1;31m"
  _nrml="\e[1;32m"
  _cfg_dir="~/.config/${_pkgname}/"
  msg2 "${_rd} Please note:\n\t${_nrml}To get started with gensystray, type:\n\t${_ylo}mkdir -p ${_cfg_dir}\n\t${_nrml}Then copy ${_ylo}${_install_dir}gensystray.sample.cfg ${_nrml}to${_ylo} ${_cfg_dir}${_pkgname}.cfg\n\t${_nrml}and edit it using your favorite text editor."
}
