# Maintainer: Savino Jossi <savino.jossi@gmail.com>
# Maintainer: Harry Law <orald@airmail.cc>

_pkgname=scientifica
pkgname=${_pkgname}-font
pkgver=1.0.2
pkgrel=1
pkgdesc='Tall and condensed bitmap font for geeks.'
arch=(any)
url=https://github.com/NerdyPepper/scientifica
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
conflicts=(scientifica-font)
provides=(scientifica-font)
install=scientifica-font.install
source=(https://raw.githubusercontent.com/NerdyPepper/${_pkgname}/master/bold/${_pkgname}Bold-11.bdf
        https://raw.githubusercontent.com/NerdyPepper/${_pkgname}/master/regular/${_pkgname}-11.bdf)
md5sums=('3767c286c70e670a86ee50c3e30ebfac'
	 '1b23c948030e09bcac0bae375a0fca37')

prepare()
{
  echo "Enabling bitmap fonts..."
  rm -fv /etc/fonts/conf.d/10-autohint.conf /etc/fonts/conf.d/10-scale-bitmap-fonts.conf
  echo "10-autohint and 10-scale-bitmap deleted."
  rm -fv /etc/fonts/conf.d/70-no-bitmaps.conf
  echo "70-no-bitmaps deleted."
  if [[ ! -f /etc/fonts/conf.d/70-yes-bitmaps.conf ]]; then
    ln -sf /etc/fonts/conf.avail/70-yes-bitmaps.conf "${pkgdir}/etc/fonts/conf.d/"
	echo "70-yes-bitmaps symlinked."
  fi

}

build()
{
echo "Building custom install script..."
cat <<EOF > 75-yes-scientifica.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<!-- Accept scientifica font -->
  <selectfont>
    <acceptfont>
      <pattern>
        <patelt name="family"><string>scientifica</string></patelt>
      </pattern>
    </acceptfont>
  </selectfont>
</fontconfig>
EOF
}

package()
{
  echo "Installing regular and bold fonts..."
  install -Dm644 scientifica-11.bdf "${pkgdir}/usr/share/fonts/misc/scientifica-11.bdf"
  install -Dm644 scientificaBold-11.bdf "${pkgdir}/usr/share/fonts/misc/scientificaBold-11.bdf"
  echo "Fonts in /usr/share/fonts/misc"
  install -Dm644 75-yes-scientifica.conf "${pkgdir}/etc/fonts/conf.avail/75-yes-scientifica.conf"
  echo "75-yes-scientifica in /etc/fonts/conf.avail"
  install -dm755 "${pkgdir}/etc/fonts/conf.d"
  install -dm755 "${pkgdir}/usr/share/fonts"
  ln -sf -t "${pkgdir}/etc/fonts/conf.d" ../conf.avail/75-yes-scientifica.conf
  echo "75-yes-scientifica sumlinked."
}
