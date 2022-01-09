# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-full
pkgname=(handbrake-full handbrake-full-cli)
pkgver=1.5.0
pkgrel=1
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, fdk-aac, qsv, vce, numa, hardened"
arch=(i686 x86_64)
url="https://handbrake.fr/"
license=(GPL)
source=("${pkgbase%-full}::git+https://github.com/HandBrake/HandBrake.git#tag=${pkgver}"
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/AMF-1.4.18.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/dav1d-0.9.2.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/fdk-aac-2.0.1.tar.gz'
        #'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/ffmpeg-4.4.1.tar.bz2'
        'https://ffmpeg.org/releases/ffmpeg-4.4.1.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libbluray-1.3.0.tar.bz2'
	    'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdvdnav-6.1.1.tar.bz2'
	    'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdvdread-6.1.1.tar.bz2'
	    'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libvpx-1.7.0.tar.gz'
	    'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/mfx_dispatch-1.35.tar.gz'
	    'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/nv-codec-headers-11.0.10.1.tar.gz'
	    'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/oneVPL-2021.6.0.tar.gz'
	    'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/x265_3.5.tar.gz'
	    'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/zimg-3.0.3.tar.gz')
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame
             libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk3 librsvg libgudev)
makedepends=(git intltool python nasm wget cmake meson
             x264
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for enabling Nvidia nvenc')
sha256sums=('SKIP'
            '4f21ee07c8bb9b73ff48dbce7cb0917cdcd4d81d33333da391d97ce7f00642fe'
            '0d198c4fe63fe7f0395b1b17de75b21c8c4508cd3204996229355759efa30ef8'
            'a4142815d8d52d0e798212a5adea54ecf42bcd4eec8092b37a8cb615ace91dc6'
            '8fc9f20ac5ed95115a9e285647add0eedd5cc1a98a039ada14c132452f98ac42'
            'e2dbaf99e84e0a9725f4985bcb85d41e52c2261cc651d8884b1b790b5ef016f9'
            'c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48'
            '3e357309a17c5be3731385b9eabda6b7e3fa010f46022a06f104553bf8e21796'
            '1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238'
            '0790ff82158837124150ab4034db37433a92caac0f145f249d2f194d8ccba3ca'
            '97e37b85922f1167b2f0bf0bb804c3d7266cc679e78814fe820cf8912a0e1291'
            'c83590c4b0d12c4a48f4cbf4b6e8d595bf1f6f96bb262d21457793d19f7b2b6a'
            'e70a3335cacacbba0b3a20ec6fecd6783932288ebc8163ad74bcc9606477cae8'
            '5e002992bfe8b9d2867fdc9266dc84faca46f0bfd931acc2ae0124972b6170a7')

noextract=(
    'AMF-1.4.18.tar.gz'
    'dav1d-0.9.2.tar.bz2'
    'fdk-aac-2.0.1.tar.gz'
    'ffmpeg-4.4.1.tar.bz2'
    'libbluray-1.3.0.tar.bz2'
    'libdvdnav-6.1.1.tar.bz2'
    'libdvdread-6.1.1.tar.bz2'
    'libvpx-1.7.0.tar.gz'
    'mfx_dispatch-1.35.tar.gz'
    'nv-codec-headers-11.0.10.1.tar.gz'
    'oneVPL-2021.6.0.tar.gz'
    'x265_3.5.tar.gz'
    'zimg-3.0.3.tar.gz'
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
