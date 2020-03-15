# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

# This PKGBUILD is managed at https://github.com/sudoforge/pkgbuilds

# POST-INSTALLATION INSTRUCTIONS
#
# WeeChat is unable to source files from outside of a user's home directory.
# Because of this limitation, this package *DOES NOT* make this plugin available
# to WeeChat without end user interaction.
#
# Each user who wants to enable this plugin needs to create symlinks in the
# WeeChat configuration directory for their user (by default, ~/.weechat). The
# following command(s) will accomplish this:
#
#     $ ln -s /usr/lib/weechat/weemoji.json ~/.weechat/weemoji.json
#     $ ln -s /usr/lib/weechat/python/wee_slack.py ~/.weechat/python/autoload/wee_slack.py

pkgname=wee-slack-git
pkgver=2.3.0.r105.g1af420e
pkgrel=3
pkgdesc="A WeeChat plugin for slack"
arch=('any')
url="https://github.com/wee-slack/${pkgname%-git}"
license=('MIT')
depends=(
  'python-websocket-client'
  'weechat'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # Install the plugin script
  install -Dm644 wee_slack.py "${pkgdir}/usr/lib/weechat/python/wee_slack.py"

  # Install the emoji tab completion dictionary
  install -Dm644 weemoji.json "${pkgdir}/usr/lib/weechat/weemoji.json"

  # Install the plugin license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
