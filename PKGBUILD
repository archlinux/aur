# Maintainer: Abbott <abbotta4@gmail.com>
pkgname='javagmr'
pkgver=1.1.5
pkgrel=1
pkgdesc='A cross platform Giant multiplayer robot client'
url='https://github.com/eternia16/javaGMR'
arch=(x86_64)
license=('GPL3')
depends=('jre8-openjdk' 'java-openjfx')
makedepends=('jdk8-openjdk' 'maven' 'cdrtools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eternia16/javaGMR/archive/v${pkgver}.tar.gz"
'TrayNotification-5393c3a.tar.gz::https://github.com/PlusHaze/TrayNotification/archive/5393c3a54f582809d2d37bb90dcbf8cb3a8be21a.zip'
'githubupdater-0dea9a2.tar.gz::https://github.com/eternia16/javaGithubUpdater/archive/0dea9a2652c888fec06971a51199c31f903a7229.zip')

sha512sums=('97a9fae23c401c892b2acd7fd83f6fa30340885a3c49b50e4fe0c4c0e2a99873da153359a56ad691fb55cc1db82cc4ab2c8c3a06d604eaf6b84944a1da470d96'
'da5fb3b49bc6d7fdcd8efb585f8600ad2a36cd26ef759fb0276e897c3a0b8a0eb56b90b4a5b9a83814031de62c56a8952a44f2c4614e665a36b162fc8525069f'
'98e6692f1a2c012240d8cbc9066676fa29f847e9e08aeee48f66329e58a1e3763179111085146e53bd81bbfd4eaa23163d416acf2d4051de293c0a2320911259')

_pkgname='javaGMR'

build() {
  echo -e "<settings>\n  <localRepository>${srcdir}/.m2/repository</localRepository>\n</settings>" > ${srcdir}/settings.xml
  echo -e "#!/bin/sh\nexec /usr/bin/java -jar /usr/share/java/${_pkgname}.jar \"\$@\"" > ${srcdir}/${_pkgname}.sh
  cd ${srcdir}/TrayNotification-5393c3a54f582809d2d37bb90dcbf8cb3a8be21a
  mvn --global-settings ${srcdir}/settings.xml package -DskipTests
  mvn --global-settings ${srcdir}/settings.xml install:install-file -Dfile=target/TrayNotification-0.3.jar -DpomFile=pom.xml
  cd ${srcdir}/javaGithubUpdater-0dea9a2652c888fec06971a51199c31f903a7229
  mvn --global-settings ${srcdir}/settings.xml package -DskipTests
  mvn --global-settings ${srcdir}/settings.xml install:install-file -Dfile=target/githubUpdater-0.1.jar -DpomFile=pom.xml
  cd ${srcdir}/${_pkgname}-${pkgver}
  mvn --global-settings ${srcdir}/settings.xml package -DskipTests
}

package() {
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/java
  install -m 644 ${srcdir}/${_pkgname}-${pkgver}/target/${_pkgname}-${pkgver}-jar-with-dependencies.jar ${pkgdir}/usr/share/java/${_pkgname}.jar
  install -m 755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}