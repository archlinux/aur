# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=filebeat-bin
pkgver=8.1.2
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
sha512sums_i686=('4f4a7a74fd66f395da8030e3fb01d86fff53eb72a0ad7bb1009a7513e5c21712912be83ee3c9b4ed5fab942aca73e64b10606c78980a0d47544dec6624cb3536')
sha512sums_x86_64=('56524e30da3185324f0b4649202f0c9ec8ab5745ee37f28240b201f6c9b7eafe011b9157d1f6e9ccf2ec57801881dcfb0deece8f89e3663c090dfd60e671f8df')
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
