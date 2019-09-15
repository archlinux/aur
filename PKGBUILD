# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

pkgname=ruby-mailcatcher
_pkgname="${pkgname#ruby-}"
pkgver=0.7.1
pkgrel=1
pkgdesc='Catches mail and serves it through a dream'
arch=('any')
url='https://mailcatcher.me/'
license=('MIT')

depends=('ruby-eventmachine-1.0' 'ruby-mail' 'ruby-rack-1.5' 'ruby-sinatra-1' 'ruby-skinny' 'ruby-sqlite3' 'ruby-thin-1.5')
makedepends=(
  'ruby-bundler'
  'ruby'
  # Nodejs is needed otherwise rake will complain with
  # ExecJS::RuntimeUnavailable: Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
  'nodejs'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "https://github.com/sj26/mailcatcher/archive/v${pkgver}.tar.gz"
    "${_pkgname}-http.service"
    "${_pkgname}-http@.socket"
    "${_pkgname}-smtp.service"
    "${_pkgname}-smtp@.socket"
    "${_pkgname}.service"
)
sha512sums=(
    '068603a417a570265cda24f45cddd11a6170a022917edf646721c339ead59a328632b1d70e35feeef5a169d50257737acbe5149790ec65d4729ddf6f1d8a161d'
    '1cee14c7fe9e5c5550e4273f6e8c1188f774f95a0ab1523ae2c3f101003dab20f00f31591618adb7ef930db65913804aca790d4a83356830b5fa7bcbdefe43a3'
    '4cd6044c2f291ea292abbc175765748f4da6ea23f593689b35397def69d413101ff358db2d19e3596fbd6f6009ad5426d0787cedab4ead0a9a7a8a8e998533e8'
    '1b390ce75e803e55e95720f562569f630ae7aa4e03f4bfd76e6ee53c0cae048a774bc837a922989a5c2e400624967c4373cb6eeb58afb0b696ffc0ca51465212'
    'ae8801a4d6dfab7fcb2fea2e4e45c0e6a8e9ed25e6ce1a7d4fd620fadcd2c7cee3c6f78fa10d912e643f2e0126e4e2add2253fb8a445f8ebe448573650b73e5d'
    '9d5e1081e794465d48e327ff5401aa113d9777f1adca650496735247d2e9ec4bfbb07a0325b472caca0613b448ac6c6e068112950c1785e6ef6157739fa18e42'
)

prepare() {
    cd "${_pkgname}-${pkgver}"
    bundle install --path .bundle
}

build() {
    cd "${_pkgname}-${pkgver}"
    bundle exec rake package
}

package() {

    # Install systemd units
    for file in "${_pkgname}"{.service,{-http,-smtp}{.service,@.socket}}; do
        install -Dm644 "${file}" "${pkgdir}/usr/lib/systemd/system/${file}"
    done

    cd "${_pkgname}-${pkgver}"

    # _gemdir is defined inside package() because if ruby[gems] is not installed on
    # the system, makepkg will exit with an error when sourcing the PKGBUILD.
    _gemdir="${pkgdir}$(ruby -e'puts Gem.default_dir')"

    gem install --no-document --no-user-install --ignore-dependencies --install-dir "${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_pkgname}-${pkgver}.gem"
}
