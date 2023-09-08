# Maintainer  : Thaodan          <AUR+me@thaodan.de>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc
pkgver=1.3.1
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python'
         'python-m2crypto'
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
        0001-Import-zsh-completition-made-by-Holger-Macht.patch
        0002-Fetch-project-list-in-zsh-completition-at-runtime.patch
        0003-Parse-pwd-s-apiurl-in-zsh-completion.patch
        0004-Fetch-project-repositories-list-for-zsh-completion.patch
        0005-Match-more-command-aliases-in-the-zsh-completion.patch
        0006-Refactor-help-text-generation-in-zsh-completition-so.patch
        0007-Complete-help-text-for-options-that-have-separate-ha.patch
        0008-Fetch-repository-architectures-in-zsh-completition.patch
        0009-Add-zsh-completion-for-build-command.patch
        0010-Add-sb2install-support-to-osc.patch
        0011-Support-osc-copyprj-in-api-by-Islam-Amer-usage-osc-c.patch
        0012-Support-synchronous-copyproj.patch
        0013-Add-p-to-copyprj-to-enable-copying-of-prjconf.patch
        0014-Add-support-for-rebuild-and-chroot-only-in-build.-re.patch
        0015-Add-architecture-and-scheduler-maps.patch
        0016-Trap-any-kind-of-exception-during-plugin-parsing-eg-.patch
        0017-Fix-hdrmd5-check-of-downloaded-packages-from-DoD-rep.patch
)
sha256sums=('6fb9fee8dfd86276632d6a7a25169f34bec1bc251c79161b5f096a9ebde51cd8'
            '6d0343bd5254bebf4feb972b198953f7faa977411d007f7d432ed8b969ef20dd'
            '60e861db1a13b3a0dce8d9630bc77f023773c550558a2f2f5d144f56bcb01f49'
            '89d7acdb5dd2ad996f438681d16fca7d8a7fcccc0c9947647a24a93ff0820295'
            '278e8da8f3010de09e031d90cf759d24d68bd44eba9dbbef9aa78abb11e13f31'
            'f3871ab614898a9a71ccb5545211aefa8bbacebf9500126c2a1d07c2c939b29c'
            '794b07b4edc5a0a53f6780a3c9b8442264d960ceae525b7ca9407b1b853c009c'
            '88ad2c7135f972e69b0188f3f10f4907a0e5dda3bf06a80656f4772339cbfb4d'
            '33fc7b90ca2b14b66622816a895f60051f6c4dce6d843504ff4d125728043a56'
            '5fab7671bd4e4aa52930f9e52a0b1fbb6187df1ca6a8d3e975beeccc3016938e'
            '19829c5586774b65321a0c27539ce6c3d5de041faeb77efff38c00c952e36b67'
            '705395902faf621929d921e414551d14998b6daf22f0732253a648b655d448e2'
            '8ca69c2797f933e7fe7c6b4452d4ce848dbb26a35d1b143fd8017cd91f5061b8'
            '4b079b31fe946c7bf595494fab2f84cc3c094354daf8d1df4d9d5615fb0f06a9'
            '8c05cda87e16283af460d56113666b9f7896f1e77b9055da00d9f45d971bcd7c'
            'eae5f978b8385db3acae46df96fc4973f306c4a640389165a8ac54469d370e5b'
            'e690cc2396b42e2f85e961595526e056f86dd850d2b2c74178381d89d33afb6a'
            '67c916cd7ba9dcd4899477c223c79f7087c0a0077d33f95ccb465b790e052547')

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
  install -Dm755 contrib/osc.zsh "${pkgdir}/usr/share/zsh/site-functions/_osc"
}

# vim:set sts=2 ts=2 sw=2 et:
