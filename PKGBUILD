# Maintainer: Dmitriy Bogdanov <di72nn at gmail dot com>
# Contributor: Xianwen Chen <xianwen.chen at gmail dot com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=sun-wtk
pkgver="2.5.2_01"
pkgrel=3
pkgdesc="Sun Java Wireless Toolkit for CLDC (J2ME, MIDP)."
arch=('i686' 'x86_64')
url='http://www.oracle.com/technetwork/java/index-jsp-137162.html'
license=('custom')
depends=('java-runtime')
depends_i686=('gcc-libs' 'libxt')
depends_x86_64=('lib32-gcc-libs' 'lib32-libxt')  # lib32-gcc-libs or gcc-libs?
optdepends=('java-environment: to do development')
optdepends_x86_64=('bin32-jre7-openjdk: to run `emulator`')  # not sure, maybe needed for other executables
#makedepends=('zip' 'unzip')  # needed for _CUSTOMIZE_CONFIG_PATH
provides=('j2me')
install='sun-wtk.install'
source=('sun_java_wireless_toolkit-2.5.2_01-linuxi486.bin.sh::https://www.dropbox.com/s/elxibfgkcxndo3k/sun_java_wireless_toolkit-2.5.2_01-linuxi486.bin.sh?dl=1'
        'sun-wtk.install'
        'sun-wtk.sh'
        'sun-wtk.csh'
        'ktoolbar.desktop'
        'ktoolbar.png'
        'LICENSE')

sha256sums=('416ea8c8dc56e3563fc92e89bb9dde243662272bc4c88121d8fc1074044b4bb2'
            '759b4401b6f3870076702ea3e42a201315c9eb2abf78581accc879ac05e34917'
            'e317910622eb03d747f2ce89e4b985a11a874446e0a84af09f8f5d1fcec15dd8'
            '612fd83b88ceb6a0475f7bf773c803d364db8c00c458927b53317131d6358a14'
            '9fe9d03d544a7ddbcccf079889a23ad1fc5d5dbc3f2d3c53203bc4955bbaf265'
            '68629d04e2b02ba4938a20bdf86ff879fa3a7cdf864a2819da8df4ba49e42851'
            '7749af872ba607cae59f7b5a74811c76d3b73dc42120b4473be8a051f779587e')

# in case you want to compare md5sum of the main blob to the old PKGBUILD value:
# http://pkgbuild.com/git/aur-mirror.git/tree/sun-wtk/PKGBUILD
#md5sums=('6b70b6e6d426eac121db8a087991589f' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')


prepare() {
  dd bs=1024 if="${srcdir}/sun_java_wireless_toolkit-2.5.2_01-linuxi486.bin.sh" of="${srcdir}/j2mewtk-unix.zip" skip=26 2>/dev/null
  unzip -oq "${srcdir}/j2mewtk-unix.zip" -d "${srcdir}/"

  # By default WTK saves some configuration files in ~/j2mewtk/
  # Usually, you don't need to access it, so it is possible to hack WTK files a bit
  # so WTK would use ~/.j2mewtk/ ("hidden" because of dot).
  # If you want to enable such customization, uncomment the following line:
  #_CUSTOMIZE_CONFIG_PATH=1

  if [ $_CUSTOMIZE_CONFIG_PATH ]; then
    cd "${srcdir}"

    # \x08 - is the length of the new string
    REPLACE_PATTERN='s:\x07j2mewtk:\x08\.j2mewtk:'

    unzip -q bin/JadTool.jar com/sun/kvem/environment/KvemHome.class
    sed -i $REPLACE_PATTERN com/sun/kvem/environment/KvemHome.class
    zip -qu bin/JadTool.jar com/sun/kvem/environment/KvemHome.class
    rm -r com

    unzip -q wtklib/kenv.zip com/sun/kvem/environment/KvemHome.class
    sed -i $REPLACE_PATTERN com/sun/kvem/environment/KvemHome.class
    zip -qu wtklib/kenv.zip com/sun/kvem/environment/KvemHome.class
    rm -r com
  fi
}

package() {
  install -d "${pkgdir}/opt/sun-wtk"

  # install docs and index.html to /usr/share/doc/sun-wtk ?
  cp -pr "${srcdir}"/{apps,bin,docs,j2mewtk_template,lib,wtklib,index.html} "${pkgdir}/opt/sun-wtk/"

  find "${pkgdir}/opt/sun-wtk/" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/sun-wtk/" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/sun-wtk/bin/"*
  chmod 644 "${pkgdir}/opt/sun-wtk/bin/"*.jar
  chmod 644 "${pkgdir}/opt/sun-wtk/bin/"*.so
  chmod 755 "${pkgdir}/opt/sun-wtk/apps/WMADemo/bridgeAPIExample/"*.sh

  # `WTK_JRE_PATH` or `JAVA_HOME` may be used in runtime.
  # Fallback order: $WTK_JRE_PATH -> $JAVA_HOME/bin -> /usr/lib/jvm/default/bin
  vmpath='${WTK_JRE_PATH:-${JAVA_HOME:-/usr/lib/jvm/java-default-runtime/jre}}/bin/'
  sed -i -e "s@javapathtowtk=.*@javapathtowtk=$vmpath@" \
    "${pkgdir}/opt/sun-wtk/bin/"{ktoolbar,emulator,prefs,utils,defaultdevice,wscompile,mekeytool,siptool,i18ntool} \
    "${pkgdir}/opt/sun-wtk/apps/WMADemo/bridgeAPIExample/runBridgeAPIExample.sh"

  install -dm755 "${pkgdir}/etc/profile.d"
  install -m755 "${srcdir}/sun-wtk."{csh,sh} "${pkgdir}/etc/profile.d/"

  install -Dm644 "${srcdir}/ktoolbar.desktop" "${pkgdir}/usr/share/applications/ktoolbar.desktop"
  install -Dm644 "${srcdir}/ktoolbar.png" "$pkgdir/usr/share/pixmaps/ktoolbar.png"

  #sed -n 's_\r__; 4,122p; 123q' "${srcdir}/sun_java_wireless_toolkit-2.5.2_01-linuxi486.bin.sh" > LICENSE
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
