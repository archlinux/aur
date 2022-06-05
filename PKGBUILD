# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=filebeat-bin
pkgver=8.2.2
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
sha512sums_i686=('b997a7697674915818af5ea8d7007237458afa7d5e0f91870ef71c517cb4efea524dd302aa1a40cc99bc4d3c743b8d376af513cdaa0ffac792a03851e8b26f9f')
sha512sums_x86_64=('e232b1a6dc135605ff1cce4cfec14da3470811e1f8f907f6a5d54babd59d819f9b29cc5be8c2f3a2868eb70606a5a4c20af4b384cd7d19c0a61cbc9368474398')
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
