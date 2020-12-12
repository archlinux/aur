# Maintainer: Stefan Zobel <stefan dot zobel at gmail dot com>
#
# Project Loom virtual threads and continuations for the JVM (early access)
# see https://wiki.openjdk.java.net/display/loom/Main
# (source code: https://github.com/openjdk/loom)
#
pkgname=java-openjdk-loom-ea-bin

# loom is currently based on JDK 16
_majorver=16
_prerelease=9
_buildno=316
_buildver=${_prerelease}_${_buildno}


# upstream git commit
_commit="0fe3a7e4263a"
# use the first 7 digits for the Arch build version
_commit=$(echo ${_commit} | cut -c1-7)


#pkgver=${_majorver}_${_buildver}
pkgver=${_majorver}_${_commit}

pkgrel=1
# must stick to use epoch as the old upstream broke version comparisons
epoch=49

# Virtual threads (fibers) and continuations for the JVM
# Early-Access JVM prototype - don't use in production
pkgdesc="Java Project Loom OpenJDK ${_majorver} Early-Access Build"
arch=('x86_64')

url="https://jdk.java.net/loom/"

license=('GPL2')
# use namcap to identify dependencies
depends=(
  'java-environment-common>=3' 'java-runtime-common>=3'
  'ca-certificates-utils' 'nss' 'libxrender' 'libxtst'
  'alsa-lib' 'freetype2'
)
provides=(
  "java-environment=${_majorver}"
  "java-environment-openjdk=${_majorver}"
  "java-runtime=${_majorver}"
  "java-runtime-openjdk=${_majorver}"
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
)

#source=("https://download.java.net/java/early_access/loom/${_prerelease}/openjdk-${_majorver}-loom+${_prerelease}-${_buildno}_linux-x64_bin.tar.gz")
source=("https://github.com/Anlon-Burke/openjdk-loom-bin/releases/download/${epoch}/jdk-${_majorver}-loom-linux.tar.gz")

sha256sums=('13790467c08ddfb08227d50ac32ea91ffe67bd682276a07f37b3d33b4c6aff65')

_eaname=java-openjdk-loom-ea
_jvmdir=/usr/lib/jvm/${_eaname}

package() {

  # Install
  install -d "${pkgdir}${_jvmdir}"
#  cd jdk-${_majorver}
  cd jdk-${_majorver}-loom
  cp -a bin include jmods lib release "${pkgdir}${_jvmdir}/"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"

  # Legal
  install -d "${pkgdir}/usr/share/licenses/${_eaname}"
  cp -a legal "${pkgdir}/usr/share/licenses/${_eaname}/"
  ln -s /usr/share/licenses/${_eaname} "${pkgdir}${_jvmdir}/legal"

  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_eaname}"
  ln -s /etc/${_eaname} "${pkgdir}${_jvmdir}/conf"
}

