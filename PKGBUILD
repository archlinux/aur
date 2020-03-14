# Maintainer: kvaps <kvapss@gmail.com>

pkgname=opennebula-tools
pkgver=5.10.3
pkgrel=1
pkgdesc="Command-line tools for OpenNebula Cloud"
arch=('i686' 'x86_64')
url='https://opennebula.org/'
license=('Apache')
depends=(
  'ruby'
  'less'
)
makedepends=('ruby-bundler')
conflicts=(
  'opennebula'
  'opennebula-unstable'
)
backup=(
  'etc/one/cli/oneacct.yaml'
  'etc/one/cli/oneacl.yaml'
  'etc/one/cli/onecluster.yaml'
  'etc/one/cli/onedatastore.yaml'
  'etc/one/cli/onegroup.yaml'
  'etc/one/cli/onehook.yaml'
  'etc/one/cli/onehost.yaml'
  'etc/one/cli/oneimage.yaml'
  'etc/one/cli/onemarket.yaml'
  'etc/one/cli/onemarketapp.yaml'
  'etc/one/cli/onesecgroup.yaml'
  'etc/one/cli/oneshowback.yaml'
  'etc/one/cli/onetemplate.yaml'
  'etc/one/cli/oneuser.yaml'
  'etc/one/cli/onevdc.yaml'
  'etc/one/cli/onevm.yaml'
  'etc/one/cli/onevmgroup.yaml'
  'etc/one/cli/onevnet.yaml'
  'etc/one/cli/onevntemplate.yaml'
  'etc/one/cli/onevrouter.yaml'
  'etc/one/cli/onezone.yaml'
)
source=(
  "https://github.com/OpenNebula/one/archive/release-${pkgver}.tar.gz"
  'Gemfile'
  'Gemfile.lock'
)
md5sums=(
  '63a0c34c039f06ba99fbf98f6a8045b4' # package
  'cabab3dc76285c5f302c982deff89d11' # Gemfile
  'ab3c3bd10dd2c07f9d06a9e755fcf171' # Gemfile.lock
)

build() {
  bundle config --local deployment true
  bundle config --local path ${srcdir}
  bundle install
}

package() {
  # Install gems
  install -m 0755 -d "${pkgdir}/usr/share/one/gems"
  find ${srcdir}/ruby -mindepth 2 -maxdepth 2 -exec cp -r "{}" "${pkgdir}/usr/share/one/gems/" \;

  # Install configs
  install -m 0755 -d "${pkgdir}/etc/one/cli"
  find "${srcdir}/one-release-${pkgver}/src/cli/etc" -mindepth 1 -maxdepth 1 -type f -exec install -D -m644 "{}" "${pkgdir}/etc/one/cli/" \;

  # Install binaries
  install -m 0755 -d "${pkgdir}/usr/bin"
  find "${srcdir}/one-release-${pkgver}/src/cli" -mindepth 1 -maxdepth 1 -executable -type f -exec install -m755 "{}" "${pkgdir}/usr/bin/" \;

  # Install helpers
  install -m 0755 -d "${pkgdir}/usr/lib/one/ruby/cli/one_helper"
  install -D -m 644 "${srcdir}/one-release-${pkgver}/src/cli/cli_helper.rb" "${pkgdir}/usr/lib/one/ruby/cli/cli_helper.rb"
  install -D -m 644 "${srcdir}/one-release-${pkgver}/src/cli/command_parser.rb" "${pkgdir}/usr/lib/one/ruby/cli/command_parser.rb"
  install -D -m 644 "${srcdir}/one-release-${pkgver}/src/cli/one_helper.rb" "${pkgdir}/usr/lib/one/ruby/cli/one_helper.rb"
  find "${srcdir}/one-release-${pkgver}/src/cli/one_helper" -mindepth 1 -maxdepth 1 -type f -exec install -m644 "{}" "${pkgdir}/usr/lib/one/ruby/cli/one_helper/" \;

  # Install opennebula
  install -m 0755 -d "${pkgdir}/usr/lib/one/ruby/opennebula"
  install -D -m 644 "${srcdir}/one-release-${pkgver}/src/oca/ruby/opennebula.rb" "${pkgdir}/usr/lib/one/ruby/opennebula.rb"
  find "${srcdir}/one-release-${pkgver}/src/oca/ruby/opennebula/" -mindepth 1 -maxdepth 1 -type f -exec install -m644 "{}" "${pkgdir}/usr/lib/one/ruby/opennebula/" \;
}
