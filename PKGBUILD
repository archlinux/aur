# Maintainer: Sebastian Stammler <base64 -d<<<aWFtQGRlY2VudHIuYWwK>
# Co-Maintainer: Benjamin Schäfer <b-schaefer at posteo dot de>

_npmname=gitmoji-cli
pkgname=nodejs-${_npmname}
pkgver=8.2.0
pkgrel=1
pkgdesc='A gitmoji interactive client for using gitmojis on commit messages'
arch=('any')
url='https://gitmoji.carloscuesta.me/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=('noto-fonts-emoji: emojis'
            'ttf-symbola: emojis'
            'ttf-joypixels: emojis'
            'ttf-twemoji-color: emojis')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('72cd1051b7079fb8eae7b4d37dd05214290954b8c0fa15de98803803944f0020')
noextract=("${source[@]##*/}")

prepare() {
  # Extract package/LICENSE
  tar -zxvf "${source[@]##*/}" --directory "${srcdir}" "package/LICENSE"
}

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${source[@]##*/}"

    # Installing license file
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # Remove references to $pkgdir in _where attributes
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i -e '/_where/d'
}
