# Maintainer: nushkovg
# Contributor: nushkovg
pkgname=kong-community-edition
pkgver=1.1.0
pkgrel=1
pkgdesc="Kong is a distributed gateway for APIs and Microservices, focused on high performance and reliability."
arch=('any')
url="https://getkong.org"
license=('Apache')
groups=('')
depends=('libyaml' 'luajit' 'openssl' 'pcre' 'zlib' 'rsync' 'wget')
options=('!strip' '!emptydirs' '!makeflags')
install=${pkgname}.install
source=("https://bintray.com/kong/kong-community-edition-deb/download_file?file_path=dists/kong-community-edition-1.1.0.stretch.all.deb")
sha512sums=('755e7b1b2cfae427c1dc49ef5bd0dff72b06fda690438f2b831762268313ce53aa14d3f42d2b8f13f6c3cb3643ef1aa74ffde7ccac14b80dd3fc527d3be5204b')

build() {

	# Prepare openresty
	wget https://openresty.org/download/openresty-1.13.6.2.tar.gz
	tar -xvf openresty-1.13.6.2.tar.gz && cd openresty-1.13.6.2
	./configure \
	  --with-pcre-jit \
	  --with-http_ssl_module \
	  --with-http_realip_module \
	  --with-http_stub_status_module \
	  --with-http_v2_module
	make
	make install
	cd ../ && rm -rf openresty-1.13.6.2/ && rm openresty-1.13.6.2.tar.gz
	echo 'export PATH=/usr/local/openresty/bin:$PATH' >> ~/.bashrc 
	echo 'export PATH=/uusr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$PATH' >> ~/.bashrc 
	source ~/.bashrc

	# Prepare luarocks
	wget https://luarocks.org/releases/luarocks-2.4.3.tar.gz
	tar -xvf luarocks-2.4.3.tar.gz && cd luarocks-2.4.3
	./configure \
	  --lua-suffix=jit \
	  --with-lua=/usr/local/openresty/luajit \
	  --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1
	make build
	make install
	cd ../ && rm -rf luarocks-2.4.3/ && rm luarocks-2.4.3.tar.gz
	luarocks install kong 1.1.0-0

}

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

	# Fix directories structure differences
	cd "${pkgdir}"
	install -D -m644 "/usr/local/openresty/pod/nginx/license_copyright.pod" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "/usr/local/openresty/pod/nginx/license_copyright.pod" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

	# # Fix openresty location
	# cd usr/local/bin/
	# sed -i "s+usr/local/openresty+opt/openresty+g" kong
	# sed -i "s+usr/local/openresty+opt/openresty+g" json2lua
	# sed -i "s+usr/local/openresty+opt/openresty+g" lapis
	# sed -i "s+usr/local/openresty+opt/openresty+g" lua2json
	# sed -i "s+usr/local/openresty+opt/openresty+g" luarocks
	# sed -i "s+usr/local/openresty+opt/openresty+g" luarocks-5.1
	# sed -i "s+usr/local/openresty+opt/openresty+g" luarocks-admin
	# sed -i "s+usr/local/openresty+opt/openresty+g" luarocks-admin-5.1
	# cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin

	rsync -a usr/local/* usr; rm -rf usr/local

	cd ..

}
