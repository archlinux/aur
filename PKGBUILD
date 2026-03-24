# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: skydrome <skydrome at@at proton mail dot com>
# Contributor: Thynix

# NOTICE: The original Freenet from 1999-2023 was renamed to Hyphanet 
# https://www.hyphanet.org/freenet-renamed-to-hyphanet.html

pkgname=hyphanet
pkgver=0.7.5.1506
pkgrel=2
pkgdesc='A peer-to-peer network for censorship-resistant and privacy-respecting publishing and communication, a.k.a The Original Freenet since 1999. This is NOT Locutus.'
arch=('x86_64' 'aarch64')
url='https://www.hyphanet.org/'
license=('GPL-2.0-or-later')
depends=(
  'java-runtime>=11'
  'nss'
)
makedepends=(
  'git'
  'java-environment>=11'
)
source=(
  "git+https://github.com/hyphanet/fred.git?signed#tag=build0${pkgver##*.}"
  'https://raw.githubusercontent.com/hyphanet/java_installer/refs/heads/next/bin/seednodes.fref'
  freenet.{hook,ini,rules,service,sysusers,tmpfiles}
  'java.security'
  'nss.cfg'
)
install=hyphanet.install

# https://www.hyphanet.org/assets/keyring.gpg
validpgpkeys=('B30C3D91069F81ECFEFED0B1B41A6047FD6C57F9')

b2sums=('78993090e6b80593fc8bfa40ef8fe153b145cb824cc664693fe32be89ebc6604f5b86b8262aad26cd6bb9c5a35d4b74e4ff2b216df07cb33f62637ded3bfe003'
        '43426e241442310e5c9ba0abddb56081eddce1db26ac3e6c55baa6f49cc264d0692bdd0d4deba8a0dd8ded24936979e310143a58b9b99576f8a39d049dcfb547'
        '61776e06447cc41a1d95aff7727819775ac4e54fe311dc9d5bd065bf5a7e17fdb326aa5c1de2161d9c32d77f46d74eba0436e0142ca9638b8928fb80d6af5282'
        '676dc9dd52f5427a60552572ad0a758725fb80d13926be03bdcef1640c5f568b3d3dc03ffc6fcb57d895aab0703105ffa020466334b32d6f9c07e4a3de712340'
        'c6b70019596072c4c856b252f3454e0e91c36bd8c3c78521ccb4f7fb98e2258fba48dd1752a8e5a31d935977b0fbb1015a9a36d76dccf1046ad691bb21439cbf'
        'dc3ff52d12de24071569870364af9945530f66faf7c3de9e2e7329b9b248e939c3334513ba8a0bb028bb2ca6f7e7c43a54359a3b6932eaad13825bd514958411'
        'fa985966cd067b13b64885da4524b306f81760542f188b3041ecb791222a5c20578ed490af8cc8a6ddfd992554b4767279e6406ace2c8332442deb12d1a18b82'
        'b77f345bc508929614601f36d7b6d5785b69d8db90ef739258e6c4f33fcabc6e2efe617acc85f7e156f0db022af1e4e4632a8d7e2e7602b6afdf74bb44761f72'
        'f5483a341dc105e5d214547999538ac3311159ccef702f1daa3fef0a70f304b399bf1d4d1ab0ef9fe8846f84c389a19a00bd92f11778b02b212b19101dce9323'
        '50d6db9e51bc720453dd9ae31c5d4f02f1b50aeb121d64ee3f128845ba3951091e64266b7be69afa1f4727b9e43222a4a4aba3a47a86d873f1ddcd25d6a94c52')

build() {
  cd fred
  export GRADLE_USER_HOME="$srcdir/fred/.gradle"
  export GRADLE_OPTS="-Dorg.gradle.internal.launcher.welcomeMessageEnabled=false"
  ./gradlew --no-build-cache --no-daemon jar copyRuntimeLibs
}

package() {
  ################
  # 1. COPY FILES
  ################

  install -Dm644 -t "$pkgdir/usr/share/java/freenet/"  ./fred/build/output/*.jar
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ./fred/LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" ./fred/{AUTHORS,CONTRIBUTING.md,NEWS.md,README.md,SECURITY.md}

  # These files can be sourced to create another Freenet instance, like how AUR/hyphanet-userspace will do in the future
  install -Dm644 -t "$pkgdir/usr/share/freenet/" {freenet.ini,java.security,nss.cfg,seednodes.fref}

  # Initialize Freenet system instance
  install -Dm644 -t "$pkgdir/var/lib/freenet/" {java.security,nss.cfg,seednodes.fref}
  # Note: /etc/freenet/freenet.ini will be installed via tmpfiles.d to ensure its presence and permission

  ############################
  # 2. INTEGRATE WITH SYSTEMD
  ############################

  install -Dm644 freenet.service "$pkgdir/usr/lib/systemd/system/freenet.service"
  install -Dm644 freenet.sysusers "$pkgdir/usr/lib/sysusers.d/freenet.conf"
  install -Dm644 freenet.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/freenet.conf"
  install -Dm644 freenet.hook "$pkgdir/usr/share/libalpm/hooks/freenet.hook"

  ############################
  # 3. TWEAKS
  ############################

  # Ananicy rule to allow Freenet to have NICE=10 as base
  install -Dm644 -t "$pkgdir/etc/ananicy.d/00-default/services/" freenet.rules

  # Ananicy rule for CachyOS services reside at /etc/ananicy.d/00-default/Services/
  install -Dm644 -t "$pkgdir/etc/ananicy.d/00-default/Services/" freenet.rules
}
