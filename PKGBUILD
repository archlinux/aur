# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-git
pkgname=('handbrake-gtk-git' 'handbrake-cli-git')
epoch=1
pkgver=1.1.0.r114.gcc1d825af
pkgrel=1
pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter"
arch=('i686' 'x86_64')
url="http://handbrake.fr/"
license=('GPL')
source=("git+https://github.com/HandBrake/HandBrake.git"
	'https://download.handbrake.fr/handbrake/contrib/fdk-aac-0.1.5.tar.gz'
	'https://download.handbrake.fr/handbrake/contrib/ffmpeg-4.0.tar.bz2'
	'https://download.handbrake.fr/handbrake/contrib/libbluray-1.0.1.tar.bz2'
	'https://download.handbrake.fr/handbrake/contrib/libdvdnav-5.0.3.tar.bz2'
	'https://download.handbrake.fr/handbrake/contrib/libvpx-1.6.1.tar.bz2'
	'https://download.handbrake.fr/handbrake/contrib/x265_2.8.tar.gz'
	'https://download.handbrake.fr/handbrake/contrib/libdvdread-5.0.3.tar.bz2')
makedepends=('git' 'cmake' 'intltool' 'python2' 'gettext' 'yasm' 'paxtest' 'lame' 'opus' 'jansson' 'libvorbis' 'libx264' 'libass' 'gtk3' 'libnotify' 'dbus-glib' 'libsamplerate' 'libtheora')
sha256sums=('SKIP'
            '2164592a67b467e5b20fdcdaf5bd4c50685199067391c6fcad4fa5521c9b4dd7'
            '318a39d906c9107d49766c63787798dd078d2a36e6670a9dfeda3c55be4573b8'
            '0f9f9a1db2f48cafc70ed2596ff3594b597e2027408f5f2be6191c245d67853a'
            '5097023e3d2b36944c763f1df707ee06b19dc639b2b68fb30113a5f2cbf60b6d'
            '1c2c0c2a97fba9474943be34ee39337dee756780fc12870ba1dc68372586a819'
            '6e59f9afc0c2b87a46f98e33b5159d56ffb3558a49d8e3d79cb7fdc6b7aaa863'
            '321cdf2dbdc83c96572bc583cd27d8c660ddb540ff16672ecb28607d018ed82b')
noextract=('fdk-aac-0.1.5.tar.gz'
	   'libav-12.2.tar.gz'
	   'libdvdnav-5.0.3.tar.bz2'
	   'x265_2.5.tar.gz'
	   'libdvdread-5.0.3.tar.bz2'
	   'libvpx-1.6.1.tar.bz2')
_gitname="HandBrake"

pkgver() {
  cd $_gitname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_gitname

  # python2 substitutions
  sed -i -e '1c#! /usr/bin/python2' "gtk/src/makedeps.py"
  sed -i -e '1c#! /usr/bin/python2' "make/configure.py"
  
  [ -d download ] || mkdir download
  for _tarball in ${noextract[@]}; do
    cp ../${_tarball} download/
  done
}

build() {
  cd $_gitname

  ./configure --launch --build="build" --prefix=/usr --enable-fdk \
	      --disable-gtk-update-checks --launch-jobs=0 \
	      --enable-x265 --force

  # Create build-specific temporary directory for ffmpeg
  install -d -m755 "build/build_tmp"

  make -C "build" TMPDIR="$srcdir/$_gitname/build/build_tmp"
  /usr/lib/paxtest/execstack -c "$srcdir/$_gitname/build/HandBrakeCLI"
  /usr/lib/paxtest/execstack -c "$srcdir/$_gitname/build/gtk/src/ghb"
}

package_handbrake-gtk-git() {
  pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter (GUI version)"
  depends=('opus' 'jansson' 'libsamplerate' 'libx264' 'libtheora' 'lame' 'libass' 'gtk3'
	   'dbus-glib' 'gst-plugins-base-libs' 'libgudev' 'libnotify')
  optdepends=('gst-plugins-bad: For Preview Window'
              'gst-plugins-good: For Preview Window'
              'gst-plugins-ugly: For Preview Window'
              'gst-libav: For Preview Window')
  provides=('handbrake-gtk' 'handbrake')
  conflicts=('handbrake-gtk' 'handbrake')

  cd $_gitname
  make -C "build" DESTDIR="$pkgdir/" install

  rm -f "$pkgdir/usr/bin/HandBrakeCLI"

  # icon-theme.cache will be rebuilt on install
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}

package_handbrake-cli-git() {
  pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter (CLI version)"
  depends=('opus' 'jansson' 'libsamplerate' 'libx264' 'libtheora' 'lame' 'libass' 'libxml2')
  provides=('handbrake-cli')
  conflicts=('handbrake-cli')
  install -D -m755 "$srcdir"/$_gitname/build/HandBrakeCLI "$pkgdir"/usr/bin/HandBrakeCLI
}
