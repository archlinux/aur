_pkgname=slimevr-server
pkgname=${_pkgname}-git
pkgver=v0.11.0.r0.5ff5f81a
pkgrel=1
pkgdesc="Server for SlimeVR Full Body Tracking System"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server"
license=('MIT' 'Apache-2.0')
groups=()
depends=("java-runtime-headless-openjdk=17")
makedepends=("java-runtime-headless-openjdk=17")
checkdepends=()
optdepends=()
provides=("slimevr-server")
conflicts=("slimevr-server")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git"
        "slimevr-server"
        "slimevr-server.service")
noextract=()
sha512sums=('SKIP'
            'eedfaa5a4b997b0cc4270acb063b470cbd6ee15b022a273a9f5a49c5023e985fd2d6240d33eac5eeb25f506d9db90bff863a62a3ed1a8b8006f292dcea293dd7'
            'faf2ecb06bb3031c507a7bfd7cc52edf08b689e7ee127de77e16dfa50c2f1fb9f9d11e3b948ee0f2c90c3667c08c2c1eaa00ffdf778d8f6c03a866632c999db6')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/SlimeVR-Server"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
 	cd "${srcdir}/SlimeVR-Server"
  git submodule update --init --recursive
  rm -rf server/android
}

build() {
  cd SlimeVR-Server
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  ./gradlew build
}

package() {
  install -Dm755 "slimevr-server" -t "${pkgdir}/usr/bin"
  install -Dm644 ${srcdir}/slimevr-server.service "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

  cd "${srcdir}/SlimeVR-Server"
  install -Dm644 "LICENSE-MIT" "LICENSE-APACHE" -t "${pkgdir}/opt/${_pkgname}"
  install -Dm644 "./server/desktop/build/libs/slimevr.jar" -t "${pkgdir}/opt/${_pkgname}"

  echo
  echo
  echo -------------------------------------------------------------
  echo 'run to start server:'
  echo 'systemctl --user daemon-reload && systemctl --user enable slimevr-server && systemctl --user start slimevr-server'
  echo -------------------------------------------------------------
  echo
  echo
}
