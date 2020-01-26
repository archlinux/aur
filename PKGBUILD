# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: sekret
# Contributor: Army
# Contributor: Funkmuscle
# Contributor: David Runge <dvzrv@archlinux.org

pkgname=guitarix-git
pkgver=0.39.0.r5.g2addb8b8
pkgrel=1
pkgdesc="A simple mono guitar amplifier and FX for JACK using Faust"
arch=('x86_64')
url="https://guitarix.org"
license=('GPL3')
groups=('ladspa-plugins' 'lv2-plugins' 'pro-audio')
depends=('avahi' 'bluez-libs' 'cairo' 'cairomm' 'gcc-libs' 'gdk-pixbuf2'
'glib2' 'glibc' 'glibmm' 'gtk2' 'gtkmm' 'libboost_iostreams.so' 'libcurl.so'
'libjack.so' 'liblilv-0.so' 'liblrdf.so' 'libsndfile.so' 'libzita-convolver.so'
'libzita-resampler.so' 'pango' 'pangomm' 'ttf-roboto')
makedepends=('git' 'boost' 'eigen' 'gperf' 'intltool' 'ladspa' 'lv2' 'waf')
provides=('libgxw.so' 'libgxwmm.so')
replaces=('guitarix2')
source=("${pkgname%-*}::git+https://git.code.sf.net/p/guitarix/git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}/trunk"
  # when building with faust 2.20.2 it fails: https://sourceforge.net/p/guitarix/bugs/86/
  waf configure --prefix=/usr \
                --enable-nls \
                --ladspa \
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

