# Maintainer: Sam Zuk <sam11120a@gmail.com>
pkgname=tx16wx-bin
pkgver=3.7.0r7685.1421
pkgrel=1
pkgdesc='TX16Wx Software Sampler'
arch=('x86_64')
url='https://www.tx16wx.com'
license=('custom:CWITEC')
depends=(
    'glibc>=2.34'
    'cairo>=1.14.0'
    'fontconfig>=2.12.6'
    'freetype2>=2.2.1'
    'libgcc>=4.0'
    'glib2>=2.16.0'
    'harfbuzz>=0.6.0'
    'pango>=1.50.3'
    'libsecret>=0.7'
    'libstdc++>=12'
    'liburing>=2.0'
    'libxcb>=1.6'
    'xcb-util-cursor>=0.0.99'
    'xcb-util-xrm>=0.0.0'
    'libxkbcommon-x11>=0.5.0'
    'libxkbcommon>=0.5.0'
    'libxml2>=2.7.4'
)
makedepends=('patchelf')
source=('https://www.tx16wx.com/download/tx16wx-software-sampler-3-linux-x64-debian-2/?wpdmdl=19516&refresh=69b42c003503c1773415424')
sha256sums=('62398a8609a9625172c5740f7ad774a3fd31cb986c004e97048ad3d30d9c5a46')

prepare() {
    tar -xzf 'data.tar.gz'

    # library paths for libxml2 differ between debian & arch
    patchelf --replace-needed libxml2.so.2 libxml2.so.16 \
	    './usr/lib/vst/TX16Wx.vst.so'
    patchelf --replace-needed libxml2.so.2 libxml2.so.16 \
	    './usr/lib/vst3/TX16Wx.vst3/Contents/x86_64-linux/TX16Wx.so'
    patchelf --replace-needed libxml2.so.2 libxml2.so.16 \
	    './usr/lib/clap/TX16Wx.clap'

    # the license is in the README, we just need to extract it
    sed '0,/^1\.) License/d;/2\.) Changelog/,/$p/d;s/^\s*//' './usr/share/TX16Wx/readme.txt' > LICENSE
}

package() {
    install -Dm755 './usr/lib/clap/TX16Wx.clap' "${pkgdir}/usr/lib/clap/TX16Wx.clap"
    install -Dm755 './usr/lib/vst/TX16Wx.vst.so' "${pkgdir}/usr/lib/vst/TX16Wx.vst.so"
    install -Dm755 -d './usr/lib/vst3/TX16Wx.vst3' "${pkgdir}/usr/lib/vst3/TX16Wx.vst3"
    cp -r './usr/lib/vst3/TX16Wx.vst3' "${pkgdir}/usr/lib/vst3/TX16Wx.vst3"
    install -Dm755 -d './usr/share/TX16Wx' "${pkgdir}/usr/share/TX16Wx"
    cp -r './usr/share/TX16Wx' "${pkgdir}/usr/share"
    install -Dm755 -d "${pkgdir}/usr/share/licenses/tx16wx"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/tx16wx"
}
