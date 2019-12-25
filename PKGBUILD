# Maintainer: 
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-git
pkgname=(handbrake-git handbrake-cli-git)
pkgver=1.3.0.r95.gc8e4c8c34
pkgrel=3
pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter"
arch=(i686 x86_64)
url="http://handbrake.fr/"
license=(GPL)
source=("${pkgname%-git}::git+https://github.com/HandBrake/HandBrake.git"
        'https://download.handbrake.fr/handbrake/contrib/AMF-1.4.9.tar.gz'
        'https://download.handbrake.fr/handbrake/contrib/dav1d-0.5.1.tar.bz2'
        'https://download.handbrake.fr/handbrake/contrib/fdk-aac-2.0.1.tar.gz'
        'https://download.handbrake.fr/handbrake/contrib/ffmpeg-4.2.1.tar.bz2'
    	'https://download.handbrake.fr/handbrake/contrib/libbluray-1.1.2.tar.bz2'
	    'https://download.handbrake.fr/handbrake/contrib/libdvdnav-6.0.1.tar.bz2'
	    'https://download.handbrake.fr/handbrake/contrib/libdvdread-6.0.2.tar.bz2'
	    'https://download.handbrake.fr/handbrake/contrib/libvpx-1.7.0.tar.gz'
	    'https://download.handbrake.fr/handbrake/contrib/mfx_dispatch-c200d83.tar.gz'
	    'https://download.handbrake.fr/handbrake/contrib/nv-codec-headers-9.0.18.1.tar.gz'
	    'https://download.handbrake.fr/handbrake/contrib/x265_3.2.1.tar.gz')
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame
             x264 jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk3 librsvg libgudev)
makedepends=(git intltool python nasm wget cmake meson
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('intel-media-server-studio: for QSV'
            'nvidia-utils: for nvenc')
sha256sums=('SKIP'
            'd10f75612da5bcbc26325adecc5d398dcddf216c0dae3406d9a29b9d0b44b112'
            '0214d201a338e8418f805b68f9ad277e33d79c18594dee6eaf6dcd74db2674a9'
            'a4142815d8d52d0e798212a5adea54ecf42bcd4eec8092b37a8cb615ace91dc6'
            '682a9fa3f6864d7f0dbf224f86b129e337bc60286e0d00dffcd710998d521624'
            'a3dd452239b100dc9da0d01b30e1692693e2a332a7d29917bf84bb10ea7c0b42'
            'e566a396f1950017088bfd760395b0565db44234195ada5413366c9d23926733'
            'f91401af213b219cdde24b46c50a57f29301feb7f965678f1d7ed4632cc6feb0'
            '1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238'
            'ec1da009e7c77fcc3e45ff665b30c9390437cd920f2951ccabf3d79e8d5703a9'
            '6181a5dac66a6990aa3baf10a77ae677f372b9068be9ef73abfd37b73fb4c745'
            'fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc')

noextract=(
    'AMF-1.4.9.tar.gz'
    'dav1d-0.5.1.tar.bz2'
    'fdk-aac-2.0.1.tar.gz'
    'ffmpeg-4.2.1.tar.bz2'
    'libbluray-1.1.2.tar.bz2'
    'libdvdnav-6.0.1.tar.bz2'
    'libdvdread-6.0.2.tar.bz2'
    'libvpx-1.7.0.tar.gz'
    'mfx_dispatch-c200d83.tar.gz'
    'nv-codec-headers-9.0.18.1.tar.gz'
    'x265_3.2.1.tar.gz'
    )

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  
  [ -d download ] || mkdir download
  for _tarball in ${noextract[@]}; do
    cp ../${_tarball} download/
  done
}

 build() {
  cd "${pkgname%-git}"

  ./configure \
    --prefix=/usr \
    --disable-gtk-update-checks \
    --enable-x265 \
    --enable-numa \
    --enable-fdk-aac \
    --enable-nvenc \
    --enable-qsv \
    --enable-vce

  make -C build
}

package_handbrake-git() {
  pkgdesc="Multithreaded video transcoder"
  depends=("${_commondeps[@]}" "${_guideps[@]}")
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews'
              'libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/handbrake/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli-git() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  optdepends=('libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/handbrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
