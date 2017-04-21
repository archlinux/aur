# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mastodon-git
pkgver=1.2.2_22_ga0ed88a9
_branch=master
pkgrel=0.1
pkgdesc="A GNU Social-compatible microblogging server"
arch=('i686' 'x86_64')
url="https://mastodon.social"
license=('AGPL-3.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-docker" "${pkgname%-git}-docker-git")
makedepends=(
    'yarn'
    'ruby-bundler>=1.14.6'
    )
depends=(
    'ffmpeg'
    'imagemagick'
    'libpqxx'
    'libxml2'
    'libxslt'
    'nodejs'
    'postgresql'
    'redis'
    'ruby>=2.4.0'
    )
source=(
    "git://github.com/tootsuite/${pkgname%-git}.git#branch=$_branch"
    "mastodon-web.service"
    "mastodon-sidekiq.service"
    "mastodon-streaming.service"
    "mastodon.target"
    )
sha256sums=('SKIP'
            '2b3a22149ee88c4bacf83aa1958b06fc791057089737596b35b6e1968b1443aa'
            '5f72e3ee2921f8b760bac614d910a3c36334ebfefdfd4ba0c9058e21d8537c73'
            '5a7bd6a66b93480468483205a12640317f5df5de3b4b4b6fcee38976bff606e4'
            '0920e862a1ad598022743381f2b0a38c3c745c7e1a6566c3fe51275bbef82e72')
install=mastodon.install
_user=mastodon
_homedir=/var/lib/mastodon
_shell=/bin/false

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

prepare() {
  bundle install --deployment --without development test
  yarn install
}

build() {
  cd "${pkgname%-git}"
  RAILS_ENV=production bundle exec rails assets:precompile
}

post_install() {
  echo "1. Configure your instance:"
  echo "    $ vim /etc/mastodon/env.production"
  echo ""
  echo "2. Create a postgres user for mastodon:"
  echo "    $ sudo -u postgres psql"
  echo "    > CREATE USER mastodon CREATEDB;"
  echo ""
  echo "3. Then setup the database for the first time:"
  echo "    $ cd ~mastodon && sudo -u mastodon RAILS_ENV=production bundle exec rails db:setup"
  echo ""
  echo "4. Create an administrator account:"
  echo "    $ cd ~mastodon && sudo -u mastodon RAILS_ENV=production bundle exec rails mastodon:make_admin USERNAME=<username>"
  echo ""
  echo "5. Enable and start instance:"
}

post_upgrade() {
  cd ~mastodon && sudo -u mastodon RAILS_ENV=production bundle exec rails db:migrate
}

package() {
  cd "${pkgname%-git}"

  for service in mastodon-{web,sidekiq,streaming}.service mastodon.target; do
    install -Dm644 "${srcdir}/${service}" "${pkgdir}/usr/lib/systemd/system/${service}"
  done
}
