# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=stone-phaser
pkgname="${_pkgname}-git"
pkgver=0.1.0.r10.geaa1787
pkgrel=1
pkgdesc="A classic analog phaser effect LADSPA, LV2 and VST2 plugin (git version)"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/stone-phaser"
license=('Boost')
depends=('cairo')
makedepends=('git' 'mesa')
#optdepends=('mod-host: for using the MOD pedal GUI')
groups=('pro-audio' 'ladspa-plugins' 'lv2-plugins' 'vst-plugins')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jpcima/${_pkgname}.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git')
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --exclude latest | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.dpf.url "${srcdir}/dpf"
  git submodule update

  cd dpf
  patch -N -r - -p 1 -i ../resources/patch/DPF-bypass.patch || return 0
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
