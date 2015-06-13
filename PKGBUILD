# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>

pkgname=discourse
pkgver=1.3.2
pkgrel=1
pkgdesc="A simple, flat forum, where replies flow down the page in a line"
arch=('i686' 'x86_64')
url="http://www.discourse.org/"
license=('GPL')
depends=('ruby>=2.0' 'ruby-bundler>=1.5.2' 'gmp' 'libxml2' 'libxslt' 'openssl'
         'krb5' 'libgcrypt' 'libgpg-error' 'postgresql-libs' 'xz' 'zlib')
makedepends=('nodejs-uglify-js')
optdepends=('apache: a webserver to deploy discourse'
            'nginx: another webserver to deploy discourse (example configs have to be fixed!)'
            'postgresql: database server'
            'postfix: mail server in order to receive mail notifications'
            'jpegoptim: needed to do optimizations on stored images'
            'pngcrush: needed to do optimizations on stored images'
            'pngout: needed to do optimizations on stored images'
            'advancecomp: needed to do optimizations on stored images'
            'gifsicle: needed to do optimizations on stored images'
            'jhead: needed to do optimizations on stored images'
            'nodejs-svgo: needed to do optimizations on stored images'
            'pngquant: needed to do optimizations on stored images'
            'optipng: needed to do optimizations on stored images')
backup=("etc/webapps/discourse/unicorn.conf.rb"
        "etc/webapps/discourse/discourse.conf")
source=("${pkgname}::git+https://github.com/discourse/discourse.git#tag=v${pkgver}"
        "discourse-sidekiq.service"
        "discourse-unicorn.service"
        "discourse-kill.service"
        "discourse-kill.timer"
        "discourse.target"
        "discourse-update.service"
        "discourse.tmpfiles.d"
        "discourse.logrotate"
        "unicorn.conf.rb"
        "apache.conf.example"
        "apache-ssl.conf.example"
        "nginx.conf.example"
        "nginx-ssl.conf.example"
        "0001-Revert-this-quickstart-file-is-confusing-and-not-nee.patch")
install="${pkgname}.install"
sha256sums=('SKIP'
            '51e2005fe002d42c8f5ffd3e9ccff54a739555c8e121584603c5d7daee255ca8'
            'ec711a14712cd7419378a92209b9db1af6a26f758f24aeddcf6e73efc763cd9b'
            '803c5b71fb350577a0e81c60ad5d511cba0d983046592a5dc8a2f9c726ec2143'
            'd8fab91c2b15e50db26caa00c034db4703b864e6434846b72225c871e4a3d508'
            'b512d219056537f7a7b749a10cfb90fb78116d7c6414e0a0bc72c08f1ced3f43'
            '0b5110b99f3356d9931ce4991344b1149a2d3be04322043b555b91d8751c7a31'
            '71fa450935dea04c30cc5a0eaaa16012ac765445644ca719b7a1d589aad1938f'
            '1c57caa7b2dad6b66db724a7db3ff8f156d0291e88cccdfb37d89e3557a7715d'
            'c76423db80d2f4b39ea5fcd95fd66dfb38de9e9862e8370dfc3a45641e2204ca'
            'b40c615d8da35fe5a02b914baf5920025ee7167b5d78b47d5905e633934ca11e'
            '8056354bac606f66a3667034ff93ffbfce3ec52664e7a809835d5cc45a121c30'
            '7d00b5d99777b4843cdc2f8fb9c65beb94375dcaa6351d2c8f6d55161512b3c5'
            'cd8965f971047ce5cf5c32d4709fe231c392893702db181300b02de86e0f70fb'
            '77fc9f233a964fbb3a4952001e575b07772d1939bf2e0872f5161512ceffd62a')

_homedir="/var/lib/${pkgname}"
_datadir="/usr/share/webapps/${pkgname}"
_logdir="/var/log/${pkgname}"
_etcdir="/etc/webapps/${pkgname}"
_systemddir="/usr/lib/systemd/system"

prepare() {
    cd "${srcdir}/${pkgname}"

    # Patch source files to include a static revision string and remove git repo.
    # Including the git repository triples the package size.
    _revision=$(git rev-parse HEAD)
    _revision_describe=$(git describe --dirty)
    if [ $_revision_describe = "latest-release" ]; then
      _revision_describe=$pkgver
    fi
    msg2 "Patching internal revision numbers ${_revision} to a static string..."
    sed -i "s|\`git rev-parse HEAD\`|'${_revision}'|g" "lib/discourse.rb"
    # This one is used on the dashboard, see:
    # https://github.com/discourse/discourse/commit/f1b606bf0890eb1f23cb9cbb9f35af86f4b94245
    sed -i "s|\`git describe --dirty\`|'${_revision_describe}'|g" "lib/discourse_updates.rb"
    rm -rf .git

    # Bring back discourse_quickstart.conf; Sam broke it:
    # https://github.com/discourse/discourse/commit/7bc220956a76463ee750d11e2c829498e83ce5eb
    patch -p1 -i "${srcdir}/0001-Revert-this-quickstart-file-is-confusing-and-not-nee.patch"

    msg2 "Patching discourse_defaults.conf to serve assets..."
    sed -i "s|serve_static_assets = false|serve_static_assets = true|g" "config/discourse_defaults.conf"
}

build() {
    cd "${srcdir}/${pkgname}"

    cpus=$(nproc)
    msg2 "Starting bundler with ${cpus} jobs..."
    msg2 "Gems will be installed into vendor/bundle."
    bundle config build.nokogiri --use-system-libraries
    bundle install --jobs ${cpus} --no-cache --no-prune --deployment --without development test
}

package() {
    cd "${srcdir}/${pkgname}"

    install -d "${pkgdir}/usr/share/webapps"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}${_datadir}"

    msg2 "Creating directories and symlinks..."
    install -d \
        "${pkgdir}${_etcdir}" \
        "${pkgdir}/usr/share/doc/${pkgname}" \
        "${pkgdir}${_homedir}" \
        "${pkgdir}/usr/lib/systemd/system"

    mv "${pkgdir}${_datadir}/public" "${pkgdir}${_homedir}/public" && \
        ln -fs "${_homedir}/public" "${pkgdir}${_datadir}/public"
    mv "${pkgdir}${_datadir}/plugins" "${pkgdir}${_homedir}/plugins" && \
        ln -fs "${_homedir}/plugins" "${pkgdir}${_datadir}/plugins"
    # We are using PrivateTmp=true to start unicorn, so this is safe!
    rm -rf "${pkgdir}${_datadir}/tmp" && ln -sf "/var/tmp" "${pkgdir}${_datadir}/tmp"
    rm -rf "${pkgdir}${_datadir}/log" && ln -sf "${_logdir}" "${pkgdir}${_datadir}/log"

    msg2 "Install and symlink config files..."
    install -Dm0644 "${srcdir}/unicorn.conf.rb" "${pkgdir}/${_etcdir}/unicorn.conf.rb"
    cp "config/discourse_quickstart.conf" "config/discourse.conf"
    for _file in "discourse.conf" "discourse_defaults.conf"; do
        mv "config/${_file}" "${pkgdir}${_etcdir}"
        ln -fs "${_etcdir}/${_file}" "${pkgdir}${_datadir}/config/"
    done

    msg2 "Installing license, documentation and example files..."
    mv "README.md" "CONTRIBUTING.md" "COPYRIGHT.txt" "${pkgdir}/usr/share/doc/${pkgname}"
    cp ${srcdir}/*.conf.example "${pkgdir}/usr/share/doc/${pkgname}"
    install -D "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    msg2 "Installing systemd service files..."
    install -Dm0644 "${srcdir}/discourse-unicorn.service" "${pkgdir}/${_systemddir}/discourse-unicorn.service"
    install -Dm0644 "${srcdir}/discourse-sidekiq.service" "${pkgdir}/${_systemddir}/discourse-sidekiq.service"
    install -Dm0644 "${srcdir}/discourse.target" "${pkgdir}/${_systemddir}/discourse.target"
    install -Dm0644 "${srcdir}/discourse-update.service" "${pkgdir}/${_systemddir}/discourse-update.service"

    msg2 "Installing systemd tmpfiles.d..."
    install -Dm0644 "${srcdir}/discourse.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/discourse.conf"

    msg2 "Installing logrotate..."
    install -Dm0644 "${srcdir}/discourse.logrotate" "${pkgdir}/etc/logrotate.d/discourse"
}
