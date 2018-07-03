# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Michael Taboada <michael@2mb.solutions>
# Contributor: Janne Heß<jannehess@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>

_pkgname=gitlab
pkgname=${_pkgname}-ee
pkgver=11.0.2
pkgrel=1
pkgdesc="Project management and code hosting application"
arch=('x86_64')
url="https://gitlab.com/gitlab-org/gitlab-ee"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=(!buildflags)
depends=('ruby2.3' 'git' 'ruby2.3-bundler' 'gitlab-workhorse' 'gitlab-gitaly' 'openssh' 'redis' 'libxslt' 'icu' 're2' 'http-parser')
makedepends=('cmake' 'postgresql' 'mariadb' 'yarn' 'go' 'nodejs')
optdepends=('postgresql: database backend'
            'mysql: database backend'
            'python2-docutils: reStructuredText markup language support'
            'smtp-server: mail server in order to receive mail notifications')
backup=("etc/webapps/${_pkgname}/application.rb"
        "etc/webapps/${_pkgname}/gitlab.yml"
        "etc/webapps/${_pkgname}/resque.yml"
        "etc/webapps/${_pkgname}/unicorn.rb"
        "etc/logrotate.d/${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/api/v4/projects/gitlab-org%2Fgitlab-ee/repository/archive?sha=v${pkgver}-ee"
        gitlab-unicorn.service
        gitlab-sidekiq.service
        gitlab-backup.service
        gitlab-mailroom.service
        gitlab-backup.timer
        gitlab.target
        gitlab.tmpfiles.d
        gitlab.logrotate
        "b41b2de702c26bfbbe375c70c48293a75546df42.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/b41b2de702c26bfbbe375c70c48293a75546df42.patch?h=packages/gitlab")
install='gitlab.install'
sha512sums=('c4413b59212fb34197d6b2ef8d57635290768ad8f1fc4baa2e2ee0636e58c67965bbbd43dcafca72d9c3ac2c4f1104873b58d183a642f4797aa838211578f687'
            'e96364b3373420a0704552584264f42fee23d64d44d3f769dffa6b516ea9d4c09873da8b2a279445ae9a09f17f81628815efc83e8d0070b3246e56aa13c02ac6'
            '1104db0397ae5f9a69452ea2a432b837cfaf37d72d063226c2156de5f753b5ae42be1f90292c34f27e251ce3d265ac9c1f79faad1d377c923e7dbc6744100471'
            'bfc98f3890dfbe11a6f7fa3275f2b04b54b8e31455dcf70abfdc7f1021ff9acb1243f7af8381465346cd780bc76fa2b1c80fada860b8c3c87c7c56bb5229c1ee'
            '1410a207279a62ca33ddd6844d41dbdb46121209668ab2fba65fbf8b97aa89da1578d39c72c3f1f2ede1770a0e16cd82c3e144d06ed62d2e76e5d2c79ce01386'
            'c11d2c59da8325551a465227096e8d39b0e4bcd5b1db21565cf3439e431838c04bc00aa6f07f4d493f3f47fd6b4e25aeb0fe0fc1a05756064706bf5708c960ec'
            'bf33b818e4ea671c16f58563997ba5fe0a09090e5c03577ff974d31324d4e9782b85a9bb4f1749b97257ce93400c692de935f003770d52b5994c9cab9aee57c6'
            'abacbff0d7be918337a17b56481c84e6bf3eddd9551efe78ba9fb74337179e95c9b60f41c49f275e05074a4074a616be36fa208a48fc12d5b940f0554fbd89c3'
            '20b93eab504e82cc4401685b59e6311b4d2c0285bc594d47ce4106d3f418a3e2ba92c4f49732748c0ba913aa3e3299126166e37d2a2d5b4d327d66bae4b8abda'
            '32c432bf5e45be7b63e078335deaab5d05f8c0e78da891038cc607beed75c670f4c825138bb2c6ba0b4cf879ef45f5cbeb12cebd4fa63d7f58362960788c9e72')

_datadir="/usr/share/webapps/${_pkgname}"
_etcdir="/etc/webapps/${_pkgname}"
_homedir="/var/lib/${_pkgname}"
_logdir="/var/log/${_pkgname}"
_srcdir="${pkgname}-v${pkgver}-ee-"

prepare() {
  # Get first 7 characters from sha1 which has 40 characters in total
  local revision=$(ls -d ${_srcdir}* | rev | cut -c 34-40 | rev)

  cd "${_srcdir}"*

  # patch -Np1 -i "${srcdir}"/b41b2de702c26bfbbe375c70c48293a75546df42.patch

  # GitLab tries to read its revision information from a file.
  echo "${revision}" > REVISION

  export SKIP_STORAGE_VALIDATION='true'

  # Patching config files:
  msg2 "Patching paths in and username gitlab.yml..."
  sed -e "s|# user: git|user: gitlab|" \
      -e "s|/home/git/gitaly/bin|/usr/bin|" \
      -e "s|/home/git/repositories|${_homedir}/repositories|" \
      -e "s|/home/git/gitlab-satellites|${_homedir}/satellites|" \
      -e "s|# path: /mnt/gitlab|path: ${_homedir}/shared|" \
      -e "s|/home/git/gitlab-shell|/usr/share/webapps/gitlab-shell|" \
      -e "s|tmp/backups|${_homedir}/backups|" \
      -e "s|/home/git/gitlab/tmp/sockets/private/gitaly.socket|${_homedir}/sockets/gitlab-gitaly.socket|" \
      config/gitlab.yml.example > config/gitlab.yml

  msg2 "Patching paths and timeout in unicorn.rb..."
  sed -e "s|/home/git/gitlab/tmp/.*/|/run/gitlab/|g" \
      -e "s|/var/run/|/run/|g" \
      -e "s|/home/git/gitlab|${_datadir}|g" \
      -e "s|${_datadir}/log/|${_logdir}/|g" \
      config/unicorn.rb.example > config/unicorn.rb

  # We need this one untouched because otherwise assets will fail
  cp config/database.yml.postgresql config/database.yml.postgresql.orig

  msg2 "Patching username in database.yml.{mysql,postgresql}..."
  sed -i -e "s|username: git|username: gitlab|" config/database.yml.mysql
  sed -i -e "s|username: git|username: gitlab|" config/database.yml.postgresql

  msg2 "Patching redis connection in resque.yml"
  sed -e "s|production: unix:/var/run/redis/redis.sock|production: redis://localhost:6379|" \
      config/resque.yml.example > config/resque.yml.patched

  msg2 "Setting up systemd service files ..."
  for service_file in gitlab-sidekiq.service gitlab-unicorn.service gitlab.logrotate gitlab-backup.service gitlab-mailroom.service; do
    sed -i "s|<HOMEDIR>|${_homedir}|g" "${srcdir}/${service_file}"
    sed -i "s|<DATADIR>|${_datadir}|g" "${srcdir}/${service_file}"
    sed -i "s|<LOGDIR>|${_logdir}|g" "${srcdir}/${service_file}"
  done
}

build() {
  cd "${srcdir}/${_srcdir}"*

  msg "Fetching bundled gems..."
  # Gems will be installed into vendor/bundle

  bundle-2.3 config build.nokogiri --use-system-libraries
  bundle-2.3 install --no-cache --deployment --without development test

  # We'll temporarily stick this in here so we can build the assets
  cp config/database.yml.postgresql.orig config/database.yml
  cp config/resque.yml.example config/resque.yml
  sed -i 's/url.*/nope.sock/g' config/resque.yml

  yarn install --production --pure-lockfile
  bundle-2.3 exec rake gitlab:assets:compile RAILS_ENV=production NODE_ENV=production
  bundle-2.3 exec rake gettext:compile RAILS_ENV=production
  # After building assets, clean this up again
  rm config/database.yml config/database.yml.postgresql.orig
  mv config/resque.yml.patched config/resque.yml
}

package() {
  cd "${srcdir}/${_srcdir}"*
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

  mv "${pkgdir}${_datadir}/.gitlab_workhorse_secret" "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  chmod 660 "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  chown root:105 "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  ln -fs "${_etcdir}/gitlab_workhorse_secret" "${pkgdir}${_datadir}/.gitlab_workhorse_secret"

  ln -fs /etc/webapps/gitlab-shell/secret "${pkgdir}${_datadir}/.gitlab_shell_secret"

  sed -i "s|require_relative '../lib|require '${_datadir}/lib|" config/application.rb

  # Fix for ruby-2.3 and bundle-2.3
  sed -i "s|bundle|bundle-2.3|g" "${pkgdir}${_datadir}/lib/tasks/gitlab/check.rake"
  grep -rl "bin/env ruby" "${pkgdir}${_datadir}" | xargs sed -i "s|bin/env ruby$|bin/env ruby-2.3|g"
  sed -i \
    -e "s|ruby --version|ruby-2.3 --version|g" \
    -e "s|gem --version|gem-2.3 --version|g" \
    -e "s|bundle --version|bundle-2.3 --version|g" \
    -e "s|rake --version|rake-2.3 --version|g" \
    "${pkgdir}${_datadir}/lib/tasks/gitlab/info.rake"

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
  mv README.md MAINTENANCE.md CONTRIBUTING.md CHANGELOG.md PROCESS.md VERSION config/*.{example,mysql,postgresql} "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # https://gitlab.com/gitlab-org/gitlab-ce/issues/765
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
