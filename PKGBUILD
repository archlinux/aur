# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.8.0
pkgrel=2
pkgdesc='Bitwarden Desktop Application'
arch=('x86_64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
makedepends=('nodejs' 'npm')
depends=('alsa-lib' 'electron' 'gconf' 'gtk2' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nspr' 'nss')
conflicts=('bitwarden-git' 'bitwarden-bin')
options=('!strip' '!emptydirs')
source=("${pkgname}-git-repo::git+https://github.com/bitwarden/desktop.git#tag=v${pkgver}"
        'jslib-git-repo::git+https://github.com/bitwarden/jslib.git'
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('SKIP'
            'SKIP'
            '4e12df4144ce40be087ef73987dd83e36f4ea2d92101ac34bfcef52059c6a94e2bdb21c73766d9b3596ac7d36d4ca75e9097f1857370ab9f99d9fbfa1f6d696e'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  cd "${pkgname}-git-repo"
  git submodule init
  git config submodule.jslib.url $srcdir/jslib-git-repo
  git submodule update
}

build() {
  cd "${pkgname}-git-repo"
  npm install
  npm run build
  npm run clean:dist
  # Make unpacked dist using electron-builder.
  # Because `npm run dist:lin` builds a bunch of other irrelevant platforms as it uses
  # the config in package.json, so we don't use that run-script here.
  npx build --dir build
}

package() {
  cd "${pkgname}-git-repo"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r dist/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  for i in 16 32 48 64 128 256 512; do
    install -Dm644 resources/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}-desktop"

  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
