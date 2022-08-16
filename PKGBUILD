# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: Icelk <main at icelk.dev>
# Contributor: Cameron Katri <katri.cameron@gmail.com>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: me at oguzkaganeren dot com dot tr
# Contributor: Rowisi < nomail <at> private <dot> com >

pkgname=vscodium-bin
_pkgname=VSCodium
pkgver=1.70.1.22228
# hack for the .xxxxx version scheme.
_pkgver=${pkgver::-6}
pkgrel=2
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing."
arch=('x86_64' 'aarch64')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=(
        fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss
        'glibc>=2.28-4'
        )
optdepends=(
        'gvfs: For move to trash functionality'
        'libdbusmenu-glib: For KDE global menu'
)
provides=('vscode' 'codium' 'vscodium')
conflicts=('vscodium' 'vscodium-git')

sha256sums=('a665ef6e2a1711df2552d7ae49fd7f30f7a2d7e0dea71c7c5f4c90764d8c37ce'
            'fd6b46c021e4f0b75d27fcf67481019dbbaa7059ea186437a47a6b6ae8bb574f')
sha256sums_x86_64=('4fd509dd190887a874dae2b2d9ebbdbcbd1b0248fcecec522a49683944774829')
sha256sums_aarch64=('c3379f4829eb67e1524fe581d6c143efcd370809da414fff85194303e11adcb9')
source=('vscodium-bin.desktop'
        'vscodium-bin-uri-handler.desktop')
source_x86_64=("https://github.com/VSCodium/vscodium/releases/download/${_pkgver}/${_pkgname}-linux-x64-${_pkgver}.tar.gz")
source_aarch64=("https://github.com/VSCodium/vscodium/releases/download/${_pkgver}/${_pkgname}-linux-arm64-${_pkgver}.tar.gz")

shopt -s extglob

package() {
  install -d -m755 ${pkgdir}/opt/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin
  install -d -m755 ${pkgdir}/usr/share/{applications,pixmaps}
  cp -r ${srcdir}/!(vscodium-bin?(-uri-handler).desktop|${_pkgname}-linux-@(x|arm)64-${_pkgver}.tar.gz) ${pkgdir}/opt/${pkgname}
  ln -s /opt/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
  ln -s /opt/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium
  install -D -m644 ${srcdir}/vscodium-bin.desktop ${pkgdir}/usr/share/applications/codium.desktop
  install -D -m644 ${srcdir}/vscodium-bin-uri-handler.desktop ${pkgdir}/usr/share/applications/codium-uri-handler.desktop
  install -D -m644 ${srcdir}/resources/app/resources/linux/code.png \
          ${pkgdir}/usr/share/pixmaps/vscodium.png

  # Symlink shell completions
  install -d -m755 ${pkgdir}/usr/share/zsh/site-functions
  install -d -m755 ${pkgdir}/usr/share/bash-completion/completions
  ln -s /opt/${pkgname}/resources/completions/zsh/_codium ${pkgdir}/usr/share/zsh/site-functions
  ln -s /opt/${pkgname}/resources/completions/bash/codium ${pkgdir}/usr/share/bash-completion/completions
}
