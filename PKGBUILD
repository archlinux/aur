# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>

pkgname=discourse
pkgver=2.5.0
pkgrel=1
pkgdesc="A simple, flat forum, where replies flow down the page in a line"
arch=('i686' 'x86_64')
url="https://www.discourse.org/"
license=('GPL')
depends=('ruby>=2.0' 'ruby-bundler' 'gmp' 'libxml2' 'libxslt' 'openssl'
         'krb5' 'libgcrypt' 'libgpg-error' 'postgresql-libs' 'xz' 'zlib')
makedepends=('uglify-js')
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
        "nginx.conf.example"
        "0001-Revert-this-quickstart-file-is-confusing-and-not-nee.patch")
install="${pkgname}.install"
sha512sums=('SKIP'
            'fdd4fbdbea672374ec1b10b33d931d9f1faf9a381fda73f58ab120cd2cc338c8fa989717c00aab6daa197650e9b5d7733fc45721b9b4ee01d6bf182e421eaaf3'
            '03bd411af6153f409a36ed8ca1abd7946613aee8b524cf11b44237b51fa239e3d11a6191c0f037ae40aeefc30f67eb6773e8d5610df7237072b1af4cf07f6c2c'
            '26a5fd92a08fdd133217a60f986221e92dca9ae1f9abc783d5f221cd04fb69fa014f90f7b56c7ba54fb46711fb7282408adbeee5706c4af2c3353069353352e9'
            'ea819bd625d68452f5222e841f3f9e0aa8b568b8c32c1b43375261f7508c215211d920c4541a91a3acfea11f9b4f8b18b4b6d9071cf3e5ee1569949141560a9c'
            'd1004ff9faeeac8f2c53b66e7bed6056e39d37d5e1bdbfe0b36685858ffc3977092185edf4579ae50af2a6cb09f628637487b09c01d50382543691442c38fc3c'
            '65b723be22b6d8656e312791652a77a20503a8d5cdca910f5fffae4e4546d73933cd9f4a900bbf92e9c7c20f59f780fcd1dfe3c3e8b47853e2d265079e0fc72f'
            'b2eb1720378684a07e35fcd7036cb9dad495750609d0fee18b4cafbcb78a13218639b6c661421bddb2731a95731cbee3c71f4d27bacac797a54130309d4b6565'
            '179d0f577b06816466206b47e9e2b21befa7010bdc2bd4a1c9116e41111549b058d2613ae94f230b31a9e0122af69ae5216f8ddef8c14fe4df220bc6f2cc8e32'
            '0a1b4d54c497f4be26799234aac3e39660fe55f5808d41c5f056943ebefcc79f7e4146d0aa7d78d90101d5cf11a2aefb59ba25fc0e15c0d33e49bfdd80b65ff3'
            'cc47f4c0697cb8a0c29caf0ccca13f7b5216157dc4728f49ae8608d5157a1fecbda92088439520bf61559209d2ba1e9cf4c200edfe87e4310893435d698ce8a5'
            '7f956d84cf732dc8f5e467723d6b08065d8c4f02ac154c6e8adc6caee189bca55b4fb7db1069a2e9d86b3bf9b2b0c905f3ae85480c2372b310accc0604c62956'
            'b19f3967ce7f056d7bf0ed6bc853512987a5901fae234b3e682612606670e206aad44fc74909fc5952adcc4730d273f870bb8dea8f4ba2521cc6f9b487231b1a')

_homedir="/var/lib/${pkgname}"
_datadir="/usr/share/webapps/${pkgname}"
_logdir="/var/log/${pkgname}"
_etcdir="/etc/webapps/${pkgname}"
_systemddir="/usr/lib/systemd/system"

prepare() {
    cd "${srcdir}/${pkgname}"
    # Install the appropriate version of bundler
    gem install bundler -v '1.17.3'
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
