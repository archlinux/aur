# Old maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>
# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=filebeat-bin
pkgver=8.18.3
pkgrel=1
pkgdesc='Filebeat sends log files to Logstash or directly to Elasticsearch'
arch=('i686' 'x86_64')
url='https://www.elastic.co/beats/filebeat'
license=('custom:Elastic')
backup=('etc/filebeat/filebeat.yml')
conflicts=(filebeat)
provides=(filebeat)
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
source=(
    "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$pkgver-amd64.deb"
    'filebeat.sysusers'
    'filebeat.tmpfiles'
)
sha512sums=(
    'f34999d50f86974cce09d9094284d4972d50f979e43fed92316078a0d01c25511b68d9c884bb4367f9b2e97f26358f4631aea071a155e1924ecc02e96f988abb'
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
