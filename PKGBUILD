# Maintainer: Jonathan Wright <jon@than.io>
# Built upon authentik-platform-git PKGBUILD by Matt Cuneo <m@cuneu.au>

pkgbase="authentik-platform-bin"
pkgdesc='authentik Platform authentication, Agent, CLI and other components'
pkgname=('authentik-cli-bin' 
         'authentik-agent-bin' 
         'authentik-agent-desktop-bin' 
         'authentik-sysd-bin'
         'libpam-authentik-bin' 
         'libnss-authentik-bin')
pkgver=0.73.0
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
               "authentik-agent-desktop.deb::https://pkg.goauthentik.io/pool/main/a/authentik-agent-desktop/authentik-agent-desktop_${pkgver}_amd64.deb"
               "authentik-cli.deb::https://pkg.goauthentik.io/pool/main/a/authentik-cli/authentik-cli_${pkgver}_amd64.deb"
               "authentik-sysd.deb::https://pkg.goauthentik.io/pool/main/a/authentik-sysd/authentik-sysd_${pkgver}_amd64.deb"
               "libnss-authentik.deb::https://pkg.goauthentik.io/pool/main/libn/libnss-authentik/libnss-authentik_${pkgver}_amd64.deb"
               "libpam-authentik.deb::https://pkg.goauthentik.io/pool/main/libp/libpam-authentik/libpam-authentik_${pkgver}_amd64.deb")

source_aarch64=("authentik-agent.deb::https://pkg.goauthentik.io/pool/main/a/authentik-agent/authentik-agent_${pkgver}_arm64.deb"
                "authentik-agent-desktop.deb::https://pkg.goauthentik.io/pool/main/a/authentik-agent-desktop/authentik-agent-desktop_${pkgver}_arm64.deb"
                "authentik-cli.deb::https://pkg.goauthentik.io/pool/main/a/authentik-cli/authentik-cli_${pkgver}_arm64.deb"
                "authentik-sysd.deb::https://pkg.goauthentik.io/pool/main/a/authentik-sysd/authentik-sysd_${pkgver}_arm64.deb"
                "libnss-authentik.deb::https://pkg.goauthentik.io/pool/main/libn/libnss-authentik/libnss-authentik_${pkgver}_arm64.deb"
                "libpam-authentik.deb::https://pkg.goauthentik.io/pool/main/libp/libpam-authentik/libpam-authentik_${pkgver}_arm64.deb")

sha256sums=('16e52ff7d18c8aa97edc8f0b06da0ac0f45f4a87ca0ce3a8cf700b5477cfaf57'
            '1db5d2f9fb1d5d6e5f9cca34e58f1b3b9f55e161d478c76198a4889dfca9fada'
            'ce6e0895be72586d3944c2b1efdffc3ee16d9e8897690a07f44be733d19b77cf')
sha256sums_x86_64=('cc1fe3ff1fdc8ea5e71911d620b67a9be33e85209ff1592cbb4cbf25236bc1f9'
                   'a2c326ae40b56d83a9e095960a8d0a38c8a65f045a1a0ba8a722eada8b52f866'
                   '055fdc3e29b2d5bc92a53409358df9e530ee2d9e3f65c354ff19c29a11beceb5'
                   '50f261bb0333416e9cce1963c2d3be6a81da3260256aa000060b8da5f5d2acb3'
                   '3935b87ed0941e908c7fb98f4555e248bc2f50be184646358e5e425d293c32f2'
                   'c8c0afccb57f1cb60ffce531213c83b0a02941683a11da8ec95f6126b0a06471')
sha256sums_aarch64=('cc1fe3ff1fdc8ea5e71911d620b67a9be33e85209ff1592cbb4cbf25236bc1f9'
                    'a2c326ae40b56d83a9e095960a8d0a38c8a65f045a1a0ba8a722eada8b52f866'
                    '055fdc3e29b2d5bc92a53409358df9e530ee2d9e3f65c354ff19c29a11beceb5'
                    '50f261bb0333416e9cce1963c2d3be6a81da3260256aa000060b8da5f5d2acb3'
                    '3935b87ed0941e908c7fb98f4555e248bc2f50be184646358e5e425d293c32f2'
                    'c8c0afccb57f1cb60ffce531213c83b0a02941683a11da8ec95f6126b0a06471')

noextract=('authentik-agent.deb'
           'authentik-agent-desktop.deb'
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

package_authentik-agent-desktop-bin() {
  pkgdesc="authentik Agent (Desktop)"
  provides=(authentik-agent)
  conflicts=(authentik-agent)
  depends=(authentik-sysd authentik-cli webkit2gtk-4.1 gtk3 libappindicator)

  bsdtar -O -xf "authentik-agent-desktop.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -
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
