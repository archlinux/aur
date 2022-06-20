# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=filebeat-bin
pkgver=8.2.3
pkgrel=1
pkgdesc='Filebeat sends log files to Logstash or directly to Elasticsearch'
arch=('i686' 'x86_64')
url='https://www.elastic.co/beats/filebeat'
license=('custom:Elastic')
backup=('etc/filebeat/filebeat.yml')
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
source_i686=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$pkgver-arm64.deb")
source_x86_64=("https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$pkgver-amd64.deb")
source=(
    'filebeat.sysusers'
    'filebeat.tmpfiles'
)
sha512sums_i686=('c426a1336c82f397e8f4bf7467bceda07c5e199009503eab8624c646a6dbb5e7aed068ecf024b3e082d6fdf36b9fae6a1228e9cd1e6f727004b8fafdf1525336')
sha512sums_x86_64=('3a32049a28e391e54b5b2ec63ed5deb5e3a3dc59cac96774cbd052e7d911bf1ae17f0a0b39b0e38ace7c16fcef9b1c5c5aaaa30a1636bc8133964dcf543b883c')
sha512sums=(
    'a8b689a8b741d1ed730056a03d5ea01600fc72caea2fd70d404727e0b79436a6af7185b5e39b9ead860dc4c0f232542b75b5c30647d10f4437a93629ed07649e'
    'c9ee78511993bc1769413c95ff78abf39cace665141c924a950ac14519fe042c877e4ff70d0eb008942b8f08ba04c2cc8aa2caf12b8da282f42a17f3f60f74a5'
)

prepare() {
    tar -xf data.tar.gz
    rm -rf etc/init.d
    mv lib usr
    chmod 644 etc/filebeat/filebeat.yml
    sed -i '/^\[Service\]$/{n;s/.*/User=filebeat/}' usr/lib/systemd/system/filebeat.service
}

package() {
    install -Dm644 filebeat.sysusers "$pkgdir/usr/lib/sysusers.d/filebeat.conf"
    install -Dm644 filebeat.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/filebeat.conf"
    cp -r etc usr "$pkgdir/"
}
