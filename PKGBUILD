# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: sekret
# Contributor: Army
# Contributor: Funkmuscle
# Contributor: David Runge <dvzrv@archlinux.org

pkgname=guitarix-git
pkgver=0.39.0.r5.g2addb8b8
pkgrel=1
pkgdesc="virtual guitar amplifier for Jack/Linux"
arch=('x86_64')
url="https://guitarix.org"
license=('GPL3')
groups=('ladspa-plugins' 'lv2-plugins' 'pro-audio')
depends=('jack' 'gtkmm' 'liblrdf' 'lilv' 'bluez-libs' 'boost-libs' 
'zita-convolver' 'zita-resampler' 'ttf-roboto' 'libsndfile')
makedepends=('git' 'boost' 'eigen' 'gperf' 'intltool' 'ladspa' 'lv2' 'waf')
provides=('guitarix' 'libgxw.so' 'libgxwmm.so')
conflicts=('guitarix')
replaces=('guitarix2')
source=("${pkgname%-*}::git+https://git.code.sf.net/p/guitarix/git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}/trunk"
  waf configure --prefix=/usr \
  				--optimization \
				--includeresampler \
				--includeconvolver \
                --enable-nls \
                --new-ladspa \
                --no-faust \
                --shared-lib \
                --lib-dev \
                --ldflags="${LDFLAGS}"
  waf build -vv
}

package() {
  cd "${pkgname%-*}/trunk"
  waf install --destdir="${pkgdir}"
  # docs
  install -vDm 644 {changelog,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

