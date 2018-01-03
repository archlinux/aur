# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=firefox-beta-bin-all-localizations
_mypkgn=firefox-beta
pkgdesc='Perl script for installing latest FF beta in the language of your choice'
url='https://www.mozilla.com/firefox/channel/#beta'
pkgver=58.0b14
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk3' 'libxt' 'dbus-glib' 'nss')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'ffmpeg: additional video and audio decoders'  # Not sure this is useful
            'hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libnotify: Notification integration'
            'pulseaudio: Audio support')
makedepends=('perl-file-slurp' 'perl-lwp-protocol-https' 'perl-switch')
provides=("firefox=$pkgver")
conflicts=("firefox-beta-bin")
source=('firefox-beta-bin.desktop' 'ff-downloader.pl' 'firefox-beta.sh')

build() {
  perl ff-downloader.pl -v $pkgver
}

package() {
  bsdtar -jxf firefox-${pkgver}.tar.bz2
  mkdir -p $pkgdir/usr/{lib,bin,share/{applications,pixmaps}}

  cp -r firefox "${pkgdir}/usr/lib/${_mypkgn}"
  install -m755 ${srcdir}/firefox-beta.sh ${pkgdir}/usr/bin/firefox-beta

  # Use system-provided dictionaries and hyphenation
  rm -rf "${pkgdir}/usr/lib/${_mypkgn}/dictionaries"
  ln -Ts /usr/share/hunspell "${pkgdir}/usr/lib/${_mypkgn}/dictionaries"
  ln -Ts /usr/share/hyphen "${pkgdir}/usr/lib/${_mypkgn}/hyphenation"

  install -m644 firefox-beta-bin.desktop ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/firefox/browser/icons/mozicon128.png ${pkgdir}/usr/share/pixmaps/${_mypkgn}.png
}
md5sums=('4c0ca11a8034b53c0c5b7b9830442cd7'
         'b4d5afd97c8ac229f6027d7853c73c0c'
         'ea377d9d48f6abe4d9b1554122fcff83')
