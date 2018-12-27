# Maintainer:  Saed Ahmed <itsaed7@gmail.com> 
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: RaNaN <ranan@pyload.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: prophy <4prophy@gmail.com>
# Contributor: carstene1ns <carsten.1 gmx net>

pkgname='pyload'
pkgver=0.4.9
pkgrel=18
pkgdesc="Downloadtool for One-Click-Hoster written in python."
url="http://www.pyload.org"
license=('GPL')
arch=('any')
conflicts=('pyload-hg' 'pyload-git')
replaces=('pyload-hg' 'pyload-git')
backup=('var/lib/pyload/pyload.conf')
depends=('python2' 'python2-crypto' 'python2-pycurl' 'tesseract'
         'python2-imaging' 'python2-pyopenssl')
optdepends=('python2-pyqt: Gui'
            'python2-flup: for additional webservers'
            'python2-notify: Notifications for GUI'
            'js: ClickNLoad')
source=("https://github.com/pyload/pyload/archive/v${pkgver}.tar.gz"
        'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/applications/pyload-gui.desktop'
        'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/applications/pyload.desktop'
        'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/pixmaps/pyload-gui.png'
        'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/pixmaps/pyload.svg'
        'pyload.service' 'pyload.conf' 'pyLoadCore' 'pyLoadCli' 'pyLoadGui' 'suppress_jinja2_version_check.patch')
install='pyload.install'
sha512sums=('c7235cdd5402fc5ab539f59829252bf4ff6199fb1742ef85bde079cff2c7bfea193de2c524573d1da45518a68cc8ef5a206e9d265219de8fd496af2c4d4c24c1'
            '86eb27f042adaf7096dec6c50bfd8f2ca0d099cbb1a27a47af276a3f42b6aebc5807022fbd9f5ca543e329543fe5ab1c3ee873163b9d90b8b3242523082b7a0d'
            '3f5d237d8e8ca469fa138e37b2118154146526340d151e8e75c79630c6bd01baab5d21f912d97fdce62ef6ff2e7c4c479d69ba8b66d3f17dbd4adb2636eddb08'
            '07ed25d6b1b62f6589f350854ac8e864bcb94a8b497d00522c3e7481d6ec2a25ba1a072b947872c7b82ca4de03ac30ffd96811bfae64df2f5dc586e4960282c6'
            '96fb4952e2fe178e6f2c0a79213b5f3c82401b0edd386698fbddfe5002d9ec676ba71cfc2cbb9fd773749fb4c3173d445cef851635d8ee981536ba7946ec8bf6'
            '50860117f9156b76e52e00e87329745b30015c20e1b2e5728ec7d65a840c585c04fa9372564ffae0645029e2727fd565a3fa4b8edd43081b65547bb85a0ba555'
            '37b6e41bdd493c5652c484a4c772e3d70da197f724ad48901451049eda019698b923a561173162771bd06ac4cf6d9da162b085535684195bb57502b5205df424'
            'd3bb07a48f90952df53eb6185988f53caf8bc3321dad8ef554889d0dde55414309a2d4fb8a800a1a85ed62c3a02e458061e061b98cfe23550599888fa6cd3975'
            'd0f90d680302780fb46fc7f473dc4ad1497f1a6b8134802820418130e16105515ca9eef8a582f1e4e3005939577c63fdcf2d8a61ecfae36b844960f145555018'
            '397791e2d6c059360703f4e249a818e1186778e63f8bea4d3c741e8e8fac2dd8ae6fcc3a6f5b05d22124eea48b26bed622f207e338aa60fef2edfa0869fcf602'
            'eb26da900c9cab96b3a08078f721686dac0bd0cc7929d48a297300cdd5693af1de98c8f581fcc2b329d9a7355b6ef7f9fc7c2ed7216ceca1becd9c9336df917f')

prepare() {
  cd "${srcdir}/pyload-${pkgver}"
  sed -i 's_#!/usr/bin/env python$_#!/usr/bin/env python2_' pyLoad*.py
  patch -p1 < "${srcdir}/suppress_jinja2_version_check.patch"
}

build() {
  python2 -O -m compileall "${srcdir}/pyload-${pkgver}"
}

package(){
  cd "${srcdir}"

  install -d -m 755 ${pkgdir}/opt/pyload
  cp -r "${srcdir}/pyload-${pkgver}"/* ${pkgdir}/opt/pyload

  install -d -m 755 ${pkgdir}/usr/share/applications
  install -D -m 644 pyload.desktop ${pkgdir}/usr/share/applications
  install -D -m 644 pyload-gui.desktop ${pkgdir}/usr/share/applications

  install -d -m 755 ${pkgdir}/usr/share/pixmaps
  install -D -m 644 pyload.svg ${pkgdir}/usr/share/pixmaps
  install -D -m 644 pyload-gui.png ${pkgdir}/usr/share/pixmaps

  install -d -m 755 ${pkgdir}/usr/bin
  install -D -m 755 pyLoadCore ${pkgdir}/usr/bin/pyLoadCore
  install -D -m 755 pyLoadCli ${pkgdir}/usr/bin/pyLoadCli
  install -D -m 755 pyLoadGui ${pkgdir}/usr/bin/pyLoadGui

  # Create PyLoad service
  install -D -m 644 ${srcdir}/pyload.service ${pkgdir}/usr/lib/systemd/system/pyload.service
  install -D -m 644 ${srcdir}/pyload.conf ${pkgdir}/var/lib/pyload/pyload.conf
}
sha512sums=('c7235cdd5402fc5ab539f59829252bf4ff6199fb1742ef85bde079cff2c7bfea193de2c524573d1da45518a68cc8ef5a206e9d265219de8fd496af2c4d4c24c1'
            '86eb27f042adaf7096dec6c50bfd8f2ca0d099cbb1a27a47af276a3f42b6aebc5807022fbd9f5ca543e329543fe5ab1c3ee873163b9d90b8b3242523082b7a0d'
            '3f5d237d8e8ca469fa138e37b2118154146526340d151e8e75c79630c6bd01baab5d21f912d97fdce62ef6ff2e7c4c479d69ba8b66d3f17dbd4adb2636eddb08'
            '07ed25d6b1b62f6589f350854ac8e864bcb94a8b497d00522c3e7481d6ec2a25ba1a072b947872c7b82ca4de03ac30ffd96811bfae64df2f5dc586e4960282c6'
            '96fb4952e2fe178e6f2c0a79213b5f3c82401b0edd386698fbddfe5002d9ec676ba71cfc2cbb9fd773749fb4c3173d445cef851635d8ee981536ba7946ec8bf6'
            '50860117f9156b76e52e00e87329745b30015c20e1b2e5728ec7d65a840c585c04fa9372564ffae0645029e2727fd565a3fa4b8edd43081b65547bb85a0ba555'
            '37b6e41bdd493c5652c484a4c772e3d70da197f724ad48901451049eda019698b923a561173162771bd06ac4cf6d9da162b085535684195bb57502b5205df424'
            'd3bb07a48f90952df53eb6185988f53caf8bc3321dad8ef554889d0dde55414309a2d4fb8a800a1a85ed62c3a02e458061e061b98cfe23550599888fa6cd3975'
            'd0f90d680302780fb46fc7f473dc4ad1497f1a6b8134802820418130e16105515ca9eef8a582f1e4e3005939577c63fdcf2d8a61ecfae36b844960f145555018'
            '397791e2d6c059360703f4e249a818e1186778e63f8bea4d3c741e8e8fac2dd8ae6fcc3a6f5b05d22124eea48b26bed622f207e338aa60fef2edfa0869fcf602'
            'eb26da900c9cab96b3a08078f721686dac0bd0cc7929d48a297300cdd5693af1de98c8f581fcc2b329d9a7355b6ef7f9fc7c2ed7216ceca1becd9c9336df917f')
