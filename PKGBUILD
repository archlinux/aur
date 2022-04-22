# Maintainer:  Peter Mattern <pmattern at arcor dot de>
# Contributor: libernux <dutchman55 at gmx dot com>

pkgname=brother-mfc-210c
pkgver=1.0.2
pkgrel=3
pkgdesc="LPR driver and CUPS wrapper for Brother MFC-210C. Covers MFC-215C as well."
arch=("i686" "x86_64")
url="http://support.brother.com"
license=("custom:Brother" "GPL")
  if test "$CARCH" == x86_64; then
    depends+=('lib32-glibc')
  fi
makedepends=("tcsh")
optdepends=("cups: use CUPS printing system"
            "tcsh: needed to use CUPS wrapper"
            "lprng: use LPRng"
            )
conflicts=("brother-lpr-drivers-common"
           "brother-lpr-drivers-extra"
           "brother-cups-wrapper-common"
           "brother-cups-wrapper-extra"
          )
install=brother-mfc-210c.install
source=("http://download.brother.com/welcome/dlf006047/MFC210Clpr-1.0.2-1.i386.rpm"
        "http://download.brother.com/welcome/dlf006049/cupswrapperMFC210C-1.0.0-1.i386.rpm"
        "adjust-setupPrintcapij-to-arch.patch"
        "adjust-cupswrapperMFC210C-1.0.0-to-arch.patch"
        )
sha256sums=("239561ee34d004edb48edcd9b80e5e2b813ae5db6675cefcb856c754ed58f571"
            "2c28381ea27e1083b17f46bacb68131411b40cb224415bba6ad358ca6376f80c"
            "6f2da3e52d5a8e4b72ef4a9a2fe821933573425a2cb20753c8be1849d55d84c7"
            "d40d9ad28b0f4600fd9cfeb3ee966c92c613acd57651b100d067be93219e3638"
            )

prepare() {

  patch -p1 < $srcdir/adjust-setupPrintcapij-to-arch.patch
  patch -p1 < $srcdir/adjust-cupswrapperMFC210C-1.0.0-to-arch.patch

  # use /usr/share/brother instead of /usr/local/Brother
  mkdir -p usr/share/cups/model
  mv usr/local/Brother usr/share/brother
  rmdir usr/local
  sed -i "s:/usr/local/Brother:/usr/share/brother:g" $(grep -rl "usr/local/Brother" .)

  # replace '/usr' by '$srcdir/usr' while running cupswrapperMFC210C-1.0.0
  sed -i "s:/usr:$srcdir/usr:g" $(grep -rl "usr" .)
  # run cupswrapperMFC210C-1.0.0 doing the actual work
  ./usr/share/brother/cupswrapper/cupswrapperMFC210C-1.0.0
  # revert path changes to get well-behaved FHS citizens again
  sed -i "s:$srcdir/usr:/usr:g" $(grep -rl "$srcdir/usr" .)
  # adjust some permission bits
  chmod 775 usr/share/brother/inf
  chmod 660 usr/share/brother/inf/brMFC210Crc
}

package() {
    cp -a usr $pkgdir
    install -D -m644 $startdir/brother-eula.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
