# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Nathan "Necopinus" <nathan@ecopunk.info>
# Contributor: Sebastian Schäfer <sarek@uliweb.de>

pkgname=tracks
pkgver=2.2.2
pkgrel=1
pkgdesc="Web-based application helping to implement the 'Getting things done' methodology"
arch=('any')
url=("http://www.getontracks.org/")
license=('GPL')
makedepends=('ruby-bundler' 'sqlite')
backup=('usr/share/webapps/tracks/config/database.yml'
        'usr/share/webapps/tracks/config/site.yml'
        'usr/share/webapps/tracks/db/tracks.sqlite3.db')
source=(
    'default_db.patch'
    'tracks.service'
    "tracks.zip::https://github.com/TracksApp/tracks/zipball/v${pkgver}")
install=${pkgname}.install
sha256sums=('d6a762be317e3753d50aca29a953cd5c8ef0aae6ddabd5807124e2e41ba46f48'
            '31f09cd39b632c91dd47e92780d29e84e2173abe268f0286de14f6126e1ba018'
            'b17a3e5f64cbdd52e44595fe65b6a9dd19028cf009704e1626fa352da14967c3')
_tracks_archive_path='TracksApp-tracks-bc8b817'

prepare() {
    cd ${srcdir}/${_tracks_archive_path}

    # Create site.yml from template
    cp config/site.yml.tmpl config/site.yml

    # Create database.yml from template
    cp config/database.yml.tmpl config/database.yml

    # Patch database.yml to use the sqlite default database
    patch -p0 < ${srcdir}/default_db.patch

    # Add Mongrel to Gemfile
    sed -i "4igem 'mongrel', '>=1.2.0.pre2'\n" Gemfile

    # Configure Tracks to serve static assets via Mongrel
    sed -i \
      's/config.serve_static_assets = false/config.serve_static_assets = true/' \
      config/environments/production.rb
}

build() {
    cd ${srcdir}/${_tracks_archive_path}

    # Use bundler to install required gems
    bundle install --without development,test --path .bundle

    # Initialize the default sqlite Database
    bundle exec rake db:migrate RAILS_ENV=production

    # Precompile statis assets
    bundle exec rake assets:precompile
}

package() {
    cd ${srcdir}

    # Create destination directories
    install -d ${pkgdir}/etc/webapps/tracks
    install -d ${pkgdir}/srv/www
    install -d ${pkgdir}/usr/share/webapps/tracks

    # Copy Tracks data to destination directory
    cp -r ${srcdir}/TracksApp-tracks-bc8b817/. \
        ${pkgdir}/usr/share/webapps/tracks/

    # Change ownership of files to http:http
    chown -R 33:33 ${pkgdir}/usr/share/webapps/tracks

    # Symlink configuration files to /etc/
    ln -s /usr/share/webapps/tracks/config/database.yml \
        ${pkgdir}/etc/webapps/tracks/database.yml

    ln -s /usr/share/webapps/tracks/config/site.yml \
        ${pkgdir}/etc/webapps/tracks/site.yml

    # Symlink tracks to /srv/www/
    ln -s /usr/share/webapps/tracks/ \
        ${pkgdir}/srv/www/tracks

    # Install systemd Service File
    install -Dm644 tracks.service \
        ${pkgdir}/usr/lib/systemd/system/tracks.service
}

