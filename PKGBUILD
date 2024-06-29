# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.8.0
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python'
         'python-cryptography'
         'python-distro')
makedepends=('python-setuptools')
optdepends=('obs-build: required to run local builds'
            'obs-service-format_spec_file: for running the format_spec_file source service'
            'obs-service-download_files: for running the download_files source service'
            'python-keyring: keyring support'
            'python-progressbar: progressbar support for operations like uploading and services'
           )
conflicts=('osc-git' 'osc-bash-completion' 'zsh-completion-osc')
replaces=('osc-bash-completion' 'zsh-completion-osc')
source=("https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz"
        0001-Add-sb2install-support-to-osc.patch
        0002-Support-osc-copyprj-in-api-by-Islam-Amer-usage-osc-c.patch
        0003-Support-synchronous-copyproj.patch
        0004-Add-p-to-copyprj-to-enable-copying-of-prjconf.patch
        0005-Add-support-for-rebuild-and-chroot-only-in-build.-re.patch
        0006-Add-architecture-and-scheduler-maps.patch
        0007-Trap-any-kind-of-exception-during-plugin-parsing-eg-.patch
        0008-Fix-hdrmd5-check-of-downloaded-packages-from-DoD-rep.patch
        0009-Add-buildlog-option-to-fetch-buildlog-not-relative-t.patch
       )


prepare() {
  # Add 'Arch_Core' and 'Arch_Extra' as osc build targets
  cd "${srcdir}/${pkgname}-${pkgver}"

  for patch in "$srcdir"/*.patch; do
    patch -p1 -i $patch
  done

  # Fix version
  sed -e "s/    version = \"%(describe:tags=true)\"/    version = \"$pkgver\"/"  \
      -i osc/util/git_version.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

  install -Dm644 contrib/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
  install -Dm755 contrib/osc.zsh "${pkgdir}/usr/share/zsh/functions/Completion/_osc"

}

sha256sums=('251ab981449209550b88bdab08ba108c104f430680b9a1ab2eb81a62bb0082d1'
            'a0c2e3634fdbda99aa04cc39b26ca67b519ca9c99bdd9efb263f7d65ad772206'
            'e189b7072386954c40d00876433261a107e167b00364d4c3ca03a33fd65da70a'
            'b28c45b7a896b921665fc121921aaa8acb439e19c47c6f593d30441ecf53ea43'
            '108925bfc7c346b65f410ead15e6848cf8ae4863193a95034a97aa92609b11cb'
            'cd8d450ce8c79c2424278bb0cc0cf3a3dc9a2e5b4509ad41af0116172b59e162'
            '579b110f3dc03001b7eac3581264200612dac66c2186e6841eda3573f455daf1'
            '6c63f30069ebf5a2d010bdd6a5e5329d9ad6faaf735831ea133cb9f652c7f8f3'
            'f01d7d59bebe114f6031f297f78456bef96b7003f55fe7ac48827e1eca7138c1'
            '82f6acd8dd601b74433562bbbb1a9b7157d43e23ca3c42e0eb163a978b29b816')

# vim:set sts=2 ts=2 sw=2 et:
