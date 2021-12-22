# Maintainer: 
# Contributor: FabioLolix
# Contributor: Florian Will <florian dot will at gmail dot com>
# Contributor: Drew DeVore <w.drew.devore at gmail dot com>

pkgname=gmrender-resurrect-git
pkgver=r336.4ac7d89
pkgrel=1
epoch=1
pkgdesc="Application to stream music from a UPnP server using gstreamer."
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/hzeller/gmrender-resurrect"
license=(GPL)
depends=(libupnp gst-plugins-good gst-plugins-base)
optdepends=('gst-libav: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs')
makedepends=(git)
backup=('etc/conf.d/gmediarender')
install='gmrender-resurrect.install'
provides=(gmediarender)
conflicts=(gmediarender)
source=("git+https://github.com/hzeller/gmrender-resurrect.git"
        'gmediarender.service'
	    'gmediarender-user.service'
	    'gmediarender')
sha256sums=('SKIP'
            '28d9a61adc76448e7e4458e77239394be4292c04176826615adf4099d0938b66'
            '54611c4131f76d2f2ae78469dc05e556bbc2a43666ca9296ebd9b5e2053865eb'
            '089b0d0854a8e74cdc9aca096b08088bb24a2c457f50b1b7146f0fa2ec2bfb69')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  ./autogen.sh
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr/
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
  install -Dm644 $srcdir/gmediarender.service "${pkgdir}/usr/lib/systemd/system/gmediarender.service"
  install -Dm644 $srcdir/gmediarender-user.service "${pkgdir}/usr/lib/systemd/user/gmediarender.service"
  install -Dm644 $srcdir/gmediarender "${pkgdir}/etc/conf.d/gmediarender"
}
