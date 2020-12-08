# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
#
#
pkgname=go4
_Pkgname=Go4
pkgver=6.0.0
pkgrel=2
pkgdesc='Object-oriented system (GSI Object Oriented On-line Off-line system) based on ROOT'
arch=('x86_64')
depends=('root' 'qt5-webengine')
url="https://www.gsi.de/en/work/research/experiment_electronics/data_processing/data_analysis/the_go4_home_page.htm"
license=('GPL')
source=("http://web-docs.gsi.de/~go4/download/go4-${pkgver}.tar.gz"
       "Makefile.config.patch")
sha256sums=('28e3ecccbbde5a9168e85d6b6b5abaa147c0d65ea70332cdaaa80050ad61c55f'
            '4f30aaffccd27ca206d5633a3b637736fbe9f34258435db6446a0c43e1f51abd')

prepare() {

  unset GO4SYS

  cd go4-${pkgver}

  # make it installation friendly
  sed -i 's#\$(GO4EXEPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4INCPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4LIBPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4TOPPATH)#$(DESTDIR)/&#g' Makefile

  # something change and the libraries are not found now at compilation time
  patch -Np2 < ${srcdir}/Makefile.config.patch

  # gSystem not found
  sed -i '1s;^;#include <TSystem.h>\n;' Go4ThreadManager/TGo4AppControlTimer.cxx

  # something with time
  sed -i '1s;^;#include <TDatime.h>\n;' Go4ConditionsBase/TGo4Condition.cxx
  sed -i '1s;^;#include <TDatime.h>\n;' Go4AnalysisClient/TGo4AnalysisClientImp.cxx

  # error: incomplete type ‘TF1’ used in nested name specifier
  sed -i 's;#include "TLatex.h";&\n#include "TF1.h";g' Go4Proxies/TGo4BrowserProxy.cxx
  sed -i 's;#include "TLatex.h";&\n#include "TF1.h";g' qt4/Go4GUI/TGo4ViewPanel.cpp

  # multiple definition of `fLogFile'
  sed -i 's;#include "rawapin.h";;g' MbsAPI/f_evt.c

  # error: ‘gVirtualX’ was not declared in this scope
  sed -i '1s;^;#include "TVirtualX.h"\n;' qt4/Go4QtRoot/QRootWindow.cpp

  # error: invalid use of incomplete type ‘class TObjString’
  sed -i '1s;^;#include "TObjString.h"\n;' qt4/Go4QtRoot/QRootCanvas.cpp
}

build() {

  cd go4-${pkgver}
  make clean-bin
  make clean

  make prefix=/usr \
       withqt=4 \
       GO4_OS=Linux \
       rpath=true \
       withdabc=yes \
       debug=1 \
       nodepend=1 \
       all || return 1

  ## options not explored
  # noweb=1
  # nox11=1

  # options known not to work Nov/22/2019
  # designer=1

}

package() {

  #install the package
  cd go4-${pkgver}
  make DESTDIR="${pkgdir}" install

  #install the license
  install -Dm644 "${srcdir}/go4-${pkgver}/Go4License.txt" "$pkgdir/usr/share/licenses/go4/Go4License.txt"

  #install the desktop file
  echo "
	[Desktop Entry]
	Name=${_PKGNAME}
	Comment=${pkgdesc}
	Exec=go4
	Icon=xchm-32
	Terminal=false
	Type=Application
	Categories=Utility;Science;
	StartupNotify=false
	" > $srcdir/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  install -d ${pkgdir}/etc/profile.d

  cat <<- EOF > ${srcdir}/go4.sh
  # source go4login script
  source /usr/bin/go4login

  # If ROOT_INCLUDE_PATH already exists, then add Go4 to it, otherwise do nothing
  export ROOT_INCLUDE_PATH=\${ROOT_INCLUDE_PATH:+\$ROOT_INCLUDE_PATH:/usr/include/go4}

  # if ROOT_INCLUDE_PATH does not exist, define it as the one from Go4, otherwise do nothing
  export ROOT_INCLUDE_PATH=\${ROOT_INCLUDE_PATH:-/usr/include/go4}

EOF

  install -m755 ${srcdir}/go4.sh  ${pkgdir}/etc/profile.d/go4.sh

  # Csh no longer supported. Go4 itself does not seem to support it.
}
