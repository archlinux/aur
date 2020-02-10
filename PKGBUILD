# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Michael Taboada <michael@2mb.solutions>
# Contributor: Janne Heß<jannehess@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>

# NOTE: Gitlab isn't always compatible with modern Ruby versions. In that case, check the
# commit log for an old fix on how to tell it to use older versions of Ruby. I'm afraid we'll
# need this again at some point in the future.
_pkgname=gitlab
pkgname=$_pkgname-ee
pkgver=12.7.5
pkgrel=3
pkgdesc="Project management and code hosting application"
arch=('x86_64')
url="https://gitlab.com/gitlab-org/gitlab"
license=('MIT')
conflicts=("$_pkgname")
provides=("$_pkgname")
options=(!buildflags)
depends=('ruby' 'ruby-bundler' 'git' 'gitlab-workhorse' 'gitlab-gitaly' 'openssh' 'redis' 'libxslt' 'icu' 're2' 'http-parser' 'nodejs')
makedepends=('cmake' 'postgresql' 'yarn' 'go' 'nodejs')
optdepends=('postgresql: database backend'
            'python2-docutils: reStructuredText markup language support'
            'smtp-server: mail server in order to receive mail notifications')
backup=("etc/webapps/${_pkgname}/application.rb"
        "etc/webapps/${_pkgname}/gitlab.yml"
        "etc/webapps/${_pkgname}/resque.yml"
        "etc/webapps/${_pkgname}/unicorn.rb"
        "etc/logrotate.d/${_pkgname}")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/api/v4/projects/gitlab-org%2Fgitlab/repository/archive?sha=v$pkgver-ee"
        build_fix.patch
        gitlab-unicorn.service
        gitlab-sidekiq.service
        gitlab-backup.service
        gitlab-mailroom.service
        gitlab-backup.timer
        gitlab.target
        gitlab.tmpfiles.d
        gitlab.logrotate
        ruby27-pop-extra-arg.patch)
install='gitlab.install'
sha512sums=('c624549b782fcc8911a95cbe1272fb94f79ab4718847b3d5df8d788f3a911a8d33bdd3e5a3c74b747bd1a27c314593cfd7788c2c908355ec749f846b837e4c63'
            'baeb28cc87be9f5e36f9bb3c98f8c81caf1f0eadab1726bcd80d89f94dfb9d00c2e086966f4ce80ac91b27dbd6b550868167e29f6b04bee6a22ead41e30c604b'
            '1ad15b48890ad48e97a6fcea56132582f2b22aa27f4a1a1f4590f3ea72de4726e13ef6f3db2bc0984da1ef140bde092e74e0c9f8f1778f207f3fac4a31a77e4b'
            '8ca36771f7568b190823ec47afeaf6ff75f61c5b6f31ce5d837a6dcd84a5b3da23fb07a1eceeda0752b2e61c4a8f4d17bf368fa2913e1487567944a8d29eeb58'
            '0cbb9a1631b529a83d5c6db95fd3a684c8f06073890b31f6262c339360444e7452275d804fb6a119a3d61a0ef1b76d0e956f260a12f032d54c00308e8d9520b0'
            '159530b50ac560c46703ef9ddd788cebc614bc53daa5b545ed8ac55f7ff4f9bb81a5149220a48770e8264e2cd5ca173f0f1f0ef4881f4e2350aaef007ea3e933'
            'c11d2c59da8325551a465227096e8d39b0e4bcd5b1db21565cf3439e431838c04bc00aa6f07f4d493f3f47fd6b4e25aeb0fe0fc1a05756064706bf5708c960ec'
            'bf33b818e4ea671c16f58563997ba5fe0a09090e5c03577ff974d31324d4e9782b85a9bb4f1749b97257ce93400c692de935f003770d52b5994c9cab9aee57c6'
            'abacbff0d7be918337a17b56481c84e6bf3eddd9551efe78ba9fb74337179e95c9b60f41c49f275e05074a4074a616be36fa208a48fc12d5b940f0554fbd89c3'
            '88e199d2f63e4f235930c35c6dfde80e6010e590907bd4de0af1fbfe6d5491ff56845aefcfe8edefa707712bd84fef96880655747b8bfb949ceeadc0456b0121'
            '0cc5c1df3cd18978df9a01bb64680d3a375c1ff4de6a453045dd26355777b4f08e3a05f55f035c8012a9683100de0bc3d11c280debcb343eb7167fc25342d5c0')
noextract=("${pkgname}-${pkgver}.tar.gz")

_datadir="/usr/share/webapps/${_pkgname}"
_etcdir="/etc/webapps/${_pkgname}"
_homedir="/var/lib/${_pkgname}"
_logdir="/var/log/${_pkgname}"
_srcdir="$_pkgname"
_pkgdir="${pkgname}-${pkgver}"

prepare() {
  mkdir -p "${_pkgdir}"
  bsdtar --strip-components 1 --cd "${_pkgdir}" -xf "${source[0]%%::*}"

  cd "${_pkgdir}"

  patch -p1 < ../build_fix.patch

  # GitLab tries to read its revision information from a file.
  bsdtar -tvf "${srcdir}/${source[0]%%::*}" | head -n1 | cut -d- -f5 | cut -c1-7 > REVISION

  export SKIP_STORAGE_VALIDATION='true'

  # Patching config files:
  echo "Patching paths in and username gitlab.yml..."
  sed -e "s|# user: git|user: gitlab|" \
      -e "s|/home/git/gitaly/bin|/usr/bin|" \
      -e "s|/home/git/repositories|${_homedir}/repositories|" \
      -e "s|/home/git/gitlab-satellites|${_homedir}/satellites|" \
      -e "s|# path: /mnt/gitlab|path: ${_homedir}/shared|" \
      -e "s|/home/git/gitlab-shell|/usr/share/webapps/gitlab-shell|" \
      -e "s|tmp/backups|${_homedir}/backups|" \
      -e "s|/home/git/gitlab/tmp/sockets/private/gitaly.socket|${_homedir}/sockets/gitlab-gitaly.socket|" \
      config/gitlab.yml.example > config/gitlab.yml

  echo "Patching paths and timeout in unicorn.rb..."
  sed -e "s|/home/git/gitlab/tmp/.*/|/run/gitlab/|g" \
      -e "s|/var/run/|/run/|g" \
      -e "s|/home/git/gitlab|${_datadir}|g" \
      -e "s|${_datadir}/log/|${_logdir}/|g" \
      config/unicorn.rb.example > config/unicorn.rb

  # We need this one untouched because otherwise assets will fail
  cp config/database.yml.postgresql config/database.yml.postgresql.orig

  echo "Patching username in database.yml.postgresql..."
  sed -i -e "s|username: git|username: gitlab|" config/database.yml.postgresql

  echo "Patching redis connection in resque.yml"
  sed -e "s|production: unix:/var/run/redis/redis.sock|production: redis://localhost:6379|" \
      config/resque.yml.example > config/resque.yml.patched

  echo "Setting up systemd service files ..."
  for service_file in gitlab-sidekiq.service gitlab-unicorn.service gitlab.logrotate gitlab-backup.service gitlab-mailroom.service; do
    sed -i "s|<HOMEDIR>|${_homedir}|g" "${srcdir}/${service_file}"
    sed -i "s|<DATADIR>|${_datadir}|g" "${srcdir}/${service_file}"
    sed -i "s|<LOGDIR>|${_logdir}|g" "${srcdir}/${service_file}"
  done

  # https://github.com/bundler/bundler/issues/6882
  sed -e '/BUNDLED WITH/,+1d' -i Gemfile.lock
  bundle lock --update=bundler-audit
  # 'lock' adds 'BUNDLED WITH' back. Remove it again.
  sed -e '/BUNDLED WITH/,+1d' -i Gemfile.lock
}

build() {
  cd "${_pkgdir}"

  echo "Fetching bundled gems..."
  # Gems will be installed into vendor/bundle
  bundle config build.gpgme --use-system-libraries  # See https://bugs.archlinux.org/task/63654
  bundle config force_ruby_platform true # some native gems are not available for newer ruby
  bundle install --jobs=$(nproc) --no-cache --deployment --without development test aws

  # workaround for a ruby2.7 issue
  # https://gitlab.com/groups/gitlab-org/-/epics/2380
  # https://github.com/ruby-grape/grape/issues/1967
  pushd vendor/bundle/ruby/2.7.0/gems/grape-1.1.0/
  patch -p1 < $srcdir/ruby27-pop-extra-arg.patch
  popd

  # We'll temporarily stick this in here so we can build the assets
  cp config/database.yml.postgresql.orig config/database.yml
  cp config/resque.yml.example config/resque.yml
  sed -i 's/url.*/nope.sock/g' config/resque.yml

  yarn install --production --pure-lockfile
  bundle exec rake gitlab:assets:compile RAILS_ENV=production NODE_ENV=production NODE_OPTIONS="--max_old_space_size=4096"
  bundle exec rake gettext:compile RAILS_ENV=production

  # After building assets, clean this up again
  rm config/database.yml config/database.yml.postgresql.orig
  mv config/resque.yml.patched config/resque.yml
}

package() {
  cd "${_pkgdir}"

  depends+=('gitlab-shell')

  install -d "${pkgdir}/usr/share/webapps"

  cp -r "${srcdir}/${_srcdir}"* "${pkgdir}${_datadir}"
  # Remove unneeded directories: node_modules is only needed during build
  rm -r "${pkgdir}${_datadir}/node_modules"
  # https://gitlab.com/gitlab-org/omnibus-gitlab/blob/194cf8f12e51c26980c09de6388bbd08409e1209/config/software/gitlab-rails.rb#L179
  for dir in spec qa rubocop app/assets vendor/assets; do
    rm -r "${pkgdir}${_datadir}/${dir}"
  done

  chown -R root:root "${pkgdir}${_datadir}"
  chmod 755 "${pkgdir}${_datadir}"

  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/satellites"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/shared/"{,artifacts,lfs-objects}
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/builds"
  install -dm700 -o 105 -g 105 "${pkgdir}${_homedir}/uploads"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/backups"
  install -dm750 -o 105 -g 105 "${pkgdir}${_etcdir}"
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"

  ln -fs /run/gitlab "${pkgdir}${_homedir}/pids"
  ln -fs /run/gitlab "${pkgdir}${_homedir}/sockets"
  ln -fs ${_datadir}/log "${pkgdir}${_homedir}/log"

  rm -rf "${pkgdir}${_datadir}/public/uploads" && ln -fs "${_homedir}/uploads" "${pkgdir}${_datadir}/public/uploads"
  rm -rf "${pkgdir}${_datadir}/builds" && ln -fs "${_homedir}/builds" "${pkgdir}${_datadir}/builds"
  rm -rf "${pkgdir}${_datadir}/tmp" && ln -fs /var/tmp "${pkgdir}${_datadir}/tmp"
  rm -rf "${pkgdir}${_datadir}/log" && ln -fs "${_logdir}" "${pkgdir}${_datadir}/log"

  # Fixes https://bugs.archlinux.org/task/59762
  ln -s "${_datadir}/config/boot.rb" "${pkgdir}"/${_etcdir}/boot.rb

  mv "${pkgdir}${_datadir}/.gitlab_workhorse_secret" "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  chmod 660 "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  chown root:105 "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  ln -fs "${_etcdir}/gitlab_workhorse_secret" "${pkgdir}${_datadir}/.gitlab_workhorse_secret"

  ln -fs /etc/webapps/gitlab-shell/secret "${pkgdir}${_datadir}/.gitlab_shell_secret"

  sed -i "s|require_relative '../lib|require '${_datadir}/lib|" config/application.rb

  # Install config files
  for config_file in application.rb gitlab.yml unicorn.rb resque.yml; do
    mv "config/${config_file}" "${pkgdir}${_etcdir}/"
    [[ -f "${pkgdir}${_datadir}/config/${config_file}" ]] && rm "${pkgdir}${_datadir}/config/${config_file}"
    ln -fs "${_etcdir}/${config_file}" "${pkgdir}${_datadir}/config/"
  done

  # Install database symlink
  ln -fs "${_etcdir}/database.yml" "${pkgdir}${_datadir}/config/database.yml"

  # Install secrets symlink
  ln -fs "${_etcdir}/secrets.yml" "${pkgdir}${_datadir}/config/secrets.yml"

  # Install license and help files
  mv README.md MAINTENANCE.md CONTRIBUTING.md CHANGELOG.md PROCESS.md VERSION config/*.{example,postgresql} "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # https://gitlab.com/gitlab-org/gitlab-foss/issues/765
  cp -r "${pkgdir}${_datadir}/doc" "${pkgdir}${_datadir}/public/help"
  find "${pkgdir}${_datadir}/public/help" -name "*.md" -exec rm {} \;
  find "${pkgdir}${_datadir}/public/help/" -depth -type d -empty -exec rmdir {} \;

  chown 105:105 "${pkgdir}${_datadir}/db/schema.rb"

  # Install systemd service files
  for service_file in gitlab-unicorn.service gitlab-sidekiq.service gitlab-backup.service gitlab-backup.timer gitlab.target gitlab-mailroom.service; do
    install -Dm644 "${srcdir}/${service_file}" "${pkgdir}/usr/lib/systemd/system/${service_file}"
  done

  install -Dm644 "${srcdir}/gitlab.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/gitlab.conf"
  install -Dm644 "${srcdir}/gitlab.logrotate" "${pkgdir}/etc/logrotate.d/gitlab"
}

# vim:set ts=2 sw=2 et:
