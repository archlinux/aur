# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-full
pkgname=(handbrake-full handbrake-full-cli)
pkgver=1.3.3
pkgrel=3
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, fdk-aac, qsv, vce, numa, hardened"
arch=(i686 x86_64)
url="https://handbrake.fr/"
license=(GPL)
source=("${pkgbase%-full}::git+https://github.com/HandBrake/HandBrake.git#tag=${pkgver}"
        'https://download.handbrake.fr/handbrake/contrib/AMF-1.4.9.tar.gz'
        'https://download.handbrake.fr/handbrake/contrib/dav1d-0.5.1.tar.bz2'
        'https://download.handbrake.fr/handbrake/contrib/fdk-aac-2.0.1.tar.gz'
        'https://download.handbrake.fr/handbrake/contrib/ffmpeg-4.2.2.tar.bz2'
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
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for enabling Nvidia nvenc')
sha256sums=('SKIP'
            'd10f75612da5bcbc26325adecc5d398dcddf216c0dae3406d9a29b9d0b44b112'
            '0214d201a338e8418f805b68f9ad277e33d79c18594dee6eaf6dcd74db2674a9'
            'a4142815d8d52d0e798212a5adea54ecf42bcd4eec8092b37a8cb615ace91dc6'
            'b620d187c26f76ca19e74210a0336c3b8380b97730df5cdf45f3e69e89000e5c'
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
    'ffmpeg-4.2.2.tar.bz2'
    'libbluray-1.1.2.tar.bz2'
    'libdvdnav-6.0.1.tar.bz2'
    'libdvdread-6.0.2.tar.bz2'
    'libvpx-1.7.0.tar.gz'
    'mfx_dispatch-c200d83.tar.gz'
    'nv-codec-headers-9.0.18.1.tar.gz'
    'x265_3.2.1.tar.gz'
    )

prepare() {
  cd "${pkgbase%-full}"
  
  [ -d download ] || mkdir download
  for _tarball in ${noextract[@]}; do
    cp ../${_tarball} download/
  done
}

 build() {
  cd "${pkgbase%-full}"

  ./configure \
    --prefix=/usr \
    --harden \
    --disable-gtk-update-checks \
    --enable-x265 \
    --enable-numa \
    --enable-fdk-aac \
    --enable-nvenc \
    --enable-qsv \
    --enable-vce

  make -C build
}

package_handbrake-full() {
  pkgdesc="Multithreaded video transcoder"
  depends=("${_commondeps[@]}" "${_guideps[@]}")
  optdepends+=('gst-plugins-good: for video previews'
              'gst-libav: for video previews')
  provides=(handbrake)
  conflicts=(handbrake)

  cd "$srcdir/handbrake/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-full-cli() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "$srcdir/handbrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
