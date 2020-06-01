#!/bin/bash
### -- Above shabeng-line for automatic syntax-highlighting in some editors. -- ###

# Maintainer:  dreieck
# Contributor: speps <speps at aur dot archlinux dot org>


_name='rezound'
pkgname="${_name}-git"
#_pkgver='latest'
 pkgver="${_pkgver}"
pkgver="latest"
# pkgver='0.13.1beta.r2022M.date20131229'
pkgrel=2
pkgdesc="A graphical audio file editor, not bloated, simple to use. Supports LADSPA-plugins."
arch=('i686' 'x86_64')
url='http://rezound.sourceforge.net/'



license=('GPL')
depends=(
         'libpulse'
         'portaudio'
         'fftw'
         'fox'
         'jack'
         'audiofile'
         'desktop-file-utils'
         'libvorbis'
         'soundtouch'
         'lame'
         'flac'
        )
makedepends=(
             'git'
             'bison'
             'flex'
            )
optdepends=(
            'cdrdao: For burn-to-CD-feature.'
           )
provides=(
          "${_name}=${pkgver}"
         )
replaces=(
          "${_name}<=${pkgver}"
         )
conflicts=(
           "$_name"
          )
install="${_name}.install"
source=(
        "git+https://github.com/Sound-Linux-More/rezound.git"
        "${_name}.png"
        "${_name}.install"
	"rezound-jack.desktop"
        "website_rendered.txt"
        "website.url"
       )
sha256sums=(
            'SKIP'
            '5a33ebae3f38bf9b824c262696ea67febc66ee2ef68fa22e976409041a08a489'
            '9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4e'
	    'SKIP'
            '8e164d279e6ebd58b1ca81bc970e6019719e6f5ee8b09cc3aa87fa7122f67867'
            'f5e97e9ae55241a0b060f2e0162a9189700f37a1de8e8bb731dfc6ece5d03f88'
           )


_pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg "Starting build..."
  cd "${srcdir}/${_name}/"

  # doc dir fix
  sed -i "/pkgdocdir/s/prefix/datarootdir/" config/am_include.mk

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --enable-oss \
    --enable-alsa \
    --enable-portaudio \
    --enable-jack \
    --enable-pulse \
    --enable-ladspa \
    --disable-rpath \
    --enable-nls
  make
}

package() {
  cd "${srcdir}/${_name}/"
  make DESTDIR="${pkgdir}/" install


  ### icon
  
  install -Dm644 "${srcdir}/${_name}.png" \
    "${pkgdir}/usr/share/pixmaps/${_name}.png"


  ### desktop files

  install -Dm644 packaging/generic_rpm/kde/x-rez.desktop \
    "${pkgdir}/usr/share/applications/x-rez.desktop"

  sed "s|\(Icon=/usr/share/\).*|\1pixmaps/${_name}.png|" \
    packaging/generic_rpm/kde/${_name}.desktop > \
    "${pkgdir}/usr/share/applications/${_name}.desktop"
  chmod 644 "${pkgdir}/usr/share/applications/${_name}.desktop"

  cp $srcdir/rezound-jack.desktop "${pkgdir}/usr/share/applications/rezound-jack.desktop"
 chmod 644 "${pkgdir}/usr/share/applications/rezound-jack.desktop"


  ### man
  install -Dm644 packaging/debian/${_name}.1 \
    "${pkgdir}/usr/share/man/man1/${_name}.1"


  ### website

  install -Dm644 "${srcdir}/website_rendered.txt" \
    "${pkgdir}/usr/share/doc/${_name}/website/website_rendered.txt"

  install -Dm644 "${srcdir}/website.url" \
    "${pkgdir}/usr/share/doc/${_name}/website/website.url"
}
