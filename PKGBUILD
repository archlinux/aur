# Maintainer: Jonathan Wright <jon@than.io>
# Built upon authentik-platform-git PKGBUILD by Matt Cuneo <m@cuneu.au>

pkgbase="authentik-platform-bin"
pkgdesc='authentik Platform authentication, Agent, CLI and other components'
pkgname=('authentik-cli-bin' 
         'authentik-agent-bin' 
         'authentik-sysd-bin'
         'libpam-authentik-bin' 
         'libnss-authentik-bin')
pkgver=0.63.3
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
sha256sums_x86_64=('b87db3de4f519104c0482e7ecdc4f98d21259ff6aac609f041806fc068467384'
                   'f8316e2470b77a2dea519ab91205c68cdc01b60aec07bab895892aa1bbcfc266'
                   '1c902a6ad7e2c2d5559952bf5d9d70b1c2511d48def57fffe8bbfb56e04762e9'
                   '7d58af0be1d81ee8ab95535bf9840c51c6bb8b53eea6f9fc09c418a6ad0f34c2'
                   'ac67e89965218bcebe0e368ec1cb7db275cd8cbc618c4ca3aad5acc439a17a55')
sha256sums_aarch64=('b87db3de4f519104c0482e7ecdc4f98d21259ff6aac609f041806fc068467384'
                    'f8316e2470b77a2dea519ab91205c68cdc01b60aec07bab895892aa1bbcfc266'
                    '1c902a6ad7e2c2d5559952bf5d9d70b1c2511d48def57fffe8bbfb56e04762e9'
                    '7d58af0be1d81ee8ab95535bf9840c51c6bb8b53eea6f9fc09c418a6ad0f34c2'
                    'ac67e89965218bcebe0e368ec1cb7db275cd8cbc618c4ca3aad5acc439a17a55')

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
