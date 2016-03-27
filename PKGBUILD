pkgname=dnssec-tlsa-validator-core
pkgver=2.2.0
pkgrel=1
pkgdesc="Google Chrome Native Messaging cores for DNSSEC & TLSA Validator"
url="https://www.dnssec-validator.cz/"
arch=(x86_64 i686)
provides=(dnssec-validator-core=$pkgver tlsa-validator-core=$pkgver)
conflicts=(dnssec-validator-core tlsa-validator-core)
source_x86_64=("https://secure.nic.cz/files/dnssec-validator/$pkgver/dnssec-plugin-$pkgver.x-linux-x86_64.sh"
               "https://secure.nic.cz/files/dnssec-validator/$pkgver/tlsa-plugin-$pkgver.x-linux-x86_64.sh")
source_i686=("https://secure.nic.cz/files/dnssec-validator/$pkgver/dnssec-plugin-$pkgver.x-linux-x86.sh"
             "https://secure.nic.cz/files/dnssec-validator/$pkgver/tlsa-plugin-$pkgver.x-linux-x86.sh")
sha256sums_x86_64=('a211dda5348325e6acc748937aa4655939d3564134b0b6d0f553d6490a31d1b5'
                   '6c05cb7016b751f7f6428b40b95874914ba8d98ae52db4f5b54f099c1aaab968')
sha256sums_i686=('b24ff5c8b980b3037a781c59021ffe5c7c2a1dc8f55b381b5b14ee8e335bf990'
                 'ece52b13719323b342215ccc4846ae072b14b07033aeac395c9c13d81190255b')

package() {
  for sh_file in *.sh; do
    sh_file=${sh_file##*/}

    tmp_dir=$sh_file.out
    rm -rf "$tmp_dir"
    mkdir "$tmp_dir"

    (
      cd "$tmp_dir"
      eval "$(sed "/Parse options/q" "../$sh_file")"
      untar_payload "../$sh_file"

      plug_file=(*-plug)
      json_file=(*.json.in)

      sed -i "s,@[^_]*_BINARY@,\"/usr/lib/$pkgname/$plug_file\"," "$json_file"

      install -Dm 755 "$plug_file" "$pkgdir/usr/lib/$pkgname/$plug_file"
      install -Dm 644 "$json_file" "$pkgdir/etc/chromium/native-messaging-hosts/${json_file%.in}"
    )
  done
}

# vim: ts=2:sw=2:et
