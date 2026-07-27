# Maintainer: Jonathan Wright <jon@than.io>
# Built upon authentik-platform-git PKGBUILD by Matt Cuneo <m@cuneu.au>

pkgbase="authentik-platform-bin"
pkgdesc='authentik Platform authentication, Agent, CLI and other components'
pkgname=('authentik-cli-bin' 
         'authentik-agent-bin' 
         'authentik-sysd-bin'
         'libpam-authentik-bin' 
         'libnss-authentik-bin')
pkgver=0.50.5
pkgrel=1
url="https://github.com/goauthentik/platform"
license=('MIT')
makedepends=()
arch=('x86_64'
      'aarch64')
options=('!strip')

source=('authentik-nss.install'
        'authentik-pam.install'
        'authentik-sysd.install')
source_x86_64=("authentik-agent.deb::https://pkg.goauthentik.io/pool/main/a/authentik-agent/authentik-agent_${pkgver}_amd64.deb"
               "authentik-cli.deb::https://pkg.goauthentik.io/pool/main/a/authentik-cli/authentik-cli_${pkgver}_amd64.deb"
               "authentik-sysd.deb::https://pkg.goauthentik.io/pool/main/a/authentik-sysd/authentik-sysd_${pkgver}_amd64.deb"
               "libnss-authentik.deb::https://pkg.goauthentik.io/pool/main/libn/libnss-authentik/libnss-authentik_${pkgver}_amd64.deb"
               "libpam-authentik.deb::https://pkg.goauthentik.io/pool/main/libp/libpam-authentik/libpam-authentik_${pkgver}_amd64.deb")

source_aarch64=("authentik-agent.deb::https://pkg.goauthentik.io/pool/main/a/authentik-agent/authentik-agent_${pkgver}_arm64.deb"
                "authentik-cli.deb::https://pkg.goauthentik.io/pool/main/a/authentik-cli/authentik-cli_${pkgver}_arm64.deb"
                "authentik-sysd.deb::https://pkg.goauthentik.io/pool/main/a/authentik-sysd/authentik-sysd_${pkgver}_arm64.deb"
                "libnss-authentik.deb::https://pkg.goauthentik.io/pool/main/libn/libnss-authentik/libnss-authentik_${pkgver}_arm64.deb"
                "libpam-authentik.deb::https://pkg.goauthentik.io/pool/main/libp/libpam-authentik/libpam-authentik_${pkgver}_arm64.deb")

sha256sums=('16e52ff7d18c8aa97edc8f0b06da0ac0f45f4a87ca0ce3a8cf700b5477cfaf57'
            '1db5d2f9fb1d5d6e5f9cca34e58f1b3b9f55e161d478c76198a4889dfca9fada'
            'ce6e0895be72586d3944c2b1efdffc3ee16d9e8897690a07f44be733d19b77cf')
sha256sums_x86_64=('846e32ad5d645e56ea03f5e6035a4f821a60d22c0d021353251c0db4c0c83222'
                   '38b63d0150ae7dbc93dcfbd510c0ab2098860b786a74cc8d111a95e72b63f1ef'
                   '98f6de439139fdb9a5f4919db98b840c5d8a2dd0ea6871af28e3fb2486e31c7d'
                   '3e1a6c2d7821beeb4793f4e6077572ea3c9262b344e5cd9b449b3c765882cb9a'
                   '11da5b4f94f74e7643a3523a48918193df2a6d81ec3b8a7802595ccc728b47c6')
sha256sums_aarch64=('846e32ad5d645e56ea03f5e6035a4f821a60d22c0d021353251c0db4c0c83222'
                    '38b63d0150ae7dbc93dcfbd510c0ab2098860b786a74cc8d111a95e72b63f1ef'
                    '98f6de439139fdb9a5f4919db98b840c5d8a2dd0ea6871af28e3fb2486e31c7d'
                    '3e1a6c2d7821beeb4793f4e6077572ea3c9262b344e5cd9b449b3c765882cb9a'
                    '11da5b4f94f74e7643a3523a48918193df2a6d81ec3b8a7802595ccc728b47c6')

noextract=('authentik-agent.deb'
           'authentik-cli.deb'
           'authentik-sysd.deb'
           'libnss-authentik.deb'
           'libpam-authentik.deb')

prepare() {
  true # Do nothing
}

package_authentik-sysd-bin() {
  pkgdesc="authentik System Agent"
  provides=(authentik-sysd)
  conflicts=(authentik-sysd)
  backup=(etc/authentik/config.json)
  install=authentik-sysd.install

  optdepends=(
    'libnss-authentik: Make the system aware of Authentik users'
    'libpam-authentik: Allow logging in as an Authentik user'
  )

  bsdtar -O -xf "authentik-sysd.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -
}

package_authentik-agent-bin() {
  pkgdesc="authentik Agent"
  provides=(authentik-agent)
  conflicts=(authentik-agent)
  depends=(authentik-sysd authentik-cli)

  bsdtar -O -xf "authentik-agent.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -
}

package_authentik-cli-bin() {
  pkgdesc="authentik CLI"
  provides=(authentik-cli)
  conflicts=(authentik-cli)
  depends=(authentik-agent authentik-sysd)

  bsdtar -O -xf "authentik-cli.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -
}

package_libnss-authentik-bin() {
  depends=(authentik-sysd)
  provides=(libnss-authentik)
  conflicts=(libnss-authentik authentik-nss)
  pkgdesc="Authentik NSS module that makes the system aware of Authentik users"
  install=authentik-nss.install

  bsdtar -O -xf "libnss-authentik.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -
}

package_libpam-authentik-bin() {
  depends=(authentik-sysd)
  provides=(libpam-authentik)
  conflicts=(libpam-authentik authentik-pam)
  pkgdesc="Authentik PAM module to enable logging in with Authentik credentials"
  install=authentik-pam.install

  bsdtar -O -xf "libnss-authentik.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -
}
