# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-git
pkgname=('handbrake-gtk-git' 'handbrake-cli-git')
pkgver=r8232
pkgrel=1
pkgdesc="Multiplatform, multithreaded DVD to MPEG-4/H264/Theora converter"
arch=('i686' 'x86_64')
url="http://handbrake.fr/"
license=('GPL')
source=("git+https://github.com/HandBrake/HandBrake.git"
	'https://download.handbrake.fr/handbrake/contrib/fdk-aac-0.1.4.tar.gz'
	'https://download.handbrake.fr/handbrake/contrib/libav-12.tar.gz'
	'https://download.handbrake.fr/handbrake/contrib/libdvdnav-5.0.1.tar.bz2'
	'https://download.handbrake.fr/contrib/x265_2.1-1.tar.gz'
	'https://download.handbrake.fr/handbrake/contrib/libdvdread-5.0.0-6-gcb1ae87.tar.gz'
	'https://download.handbrake.fr/contrib/libvpx-1.5.0.tar.bz2')
makedepends=('git' 'cmake' 'intltool' 'python2' 'gettext' 'yasm' 'paxtest' 'lame' 'opus' 'jansson' 'libvorbis' 'libx264' 'libass' 'gtk3' 'libnotify' 'dbus-glib' 'libsamplerate' 'libtheora')
sha256sums=('SKIP'
            '5910fe788677ca13532e3f47b7afaa01d72334d46a2d5e1d1f080f1173ff15ab'
            'ca5cb22ba660f0bdc47817fdb9d99059a71f9eb0776c68cf8bef769a5ccc7534'
            '72b1cb8266f163d4a1481b92c7b6c53e6dc9274d2a6befb08ffc351fe7a4a2a9'
            '88fcb9af4ba52c0757ac9c0d8cd5ec79951a22905ae886897e06954353d6a643'
            'd2e4200c3c5d5f812892f9c14851c94e2f707d54e7328946c6397ac999f15f17'
            '306d67908625675f8e188d37a81fbfafdf5068b09d9aa52702b6fbe601c76797')
noextract=('fdk-aac-0.1.4.tar.gz'
	   'libav-12.tar.gz'
	   'libdvdnav-5.0.1.tar.bz2'
	   'x265_2.1-1.tar.gz'
	   'libdvdread-5.0.0-6-gcb1ae87.tar.gz'
	   'libvpx-1.5.0.tar.bz2')
_gitname="HandBrake"

pkgver() {
  cd "$srcdir"/"$_gitname"
    printf "r%s" "$(git rev-list --count HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"

  # python2 substitutions
  sed -i -e '1c#! /usr/bin/python2' "gtk/src/makedeps.py"
  sed -i -e '1c#! /usr/bin/python2' "make/configure.py"
  
  [ -d download ] || mkdir download
  for _tarball in ${noextract[@]}; do
    cp ../${_tarball} download/
  done
}

build() {
  cd "$srcdir"/"$_gitname"

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

  cd "$srcdir"/"$_gitname"
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
  install -D -m755 "$srcdir/$_gitname/build/HandBrakeCLI" "$pkgdir/usr/bin/HandBrakeCLI"
}
