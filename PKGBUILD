# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: sekret
# Contributor: Army
# Contributor: Funkmuscle
# Contributor: David Runge <dvzrv@archlinux.org

pkgname=guitarix-git
pkgver=0.46.0.r4.g3964866a
pkgrel=1
pkgdesc="virtual guitar amplifier for Jack/Linux"
arch=('x86_64')
url="https://guitarix.org"
license=('GPL3')
groups=('ladspa-plugins' 'lv2-plugins' 'pro-audio')
depends=('jack' 'gtkmm3' 'liblo' 'liblrdf' 'libsndfile' 'lilv' 'bluez-libs' 'boost-libs' 
'zita-convolver' 'zita-resampler' 'ttf-roboto')
makedepends=('git' 'boost' 'eigen' 'gperf' 'intltool' 'ladspa' 'lv2' 'waf' 'sassc' 'pkgconfig')
provides=('lv2-host' 'libgxw.so' 'libgxwmm.so')
conflicts=('guitarix')
replaces=('guitarix2')
source=("${pkgname%-*}::git+https://github.com/brummer10/guitarix")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}/trunk"
  ./waf configure --prefix=/usr \
  				--optimization \
				--includeresampler \
				--includeconvolver \
                --enable-nls \
                --no-faust \
                --shared-lib \
                --lib-dev \
                --cxxflags='-flto' \
                --ldflags="${LDFLAGS}"
  ./waf build -vv
}

package() {
  cd "${pkgname%-*}/trunk"
  ./waf install --destdir="${pkgdir}"
  # docs
  install -vDm 644 {changelog,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

