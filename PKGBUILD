# Maintainer: Dmitry Razumov <asmeron@ublinux.ru>

pkgbase=qaratms
_pkgbase=QaraTMS
pkgname=('qaratms-en'
	'qaratms-ru'
)
pkgver=20240814
pkgrel=1
pkgdesc="QaraTMS is open source test case, test suites, test plans and test runs management tool"
arch=('any')
url="https://github.com/a13xh7/${pkgbase}"
commit_20240814="2bc0191f05395edfb7e1f96acfb7ae15222ae6a5"
commit_dc9c8fe="dc9c8fef599c22e5abd5c5402510f953a17dae7a"
license=('MIT')
depends=('sqlite'
	'oniguruma' 
	'libpng' 
	'libxml2' 
	'unzip' 
	'vim'
	'zlib' 
	'zip' 
	'php'
	'php-sqlite'
	'php-gd'
)
makedepends=("git" 
	    "composer"
)
provides=("${pkgbase}")
backup=(
    "opt/${_pkgbase}/.env"
    "opt/${_pkgbase}/database/database.sqlite"
)
#source=("${pkgname}.tar.xz")
source=("${_pkgbase}::git+${url}.git" 
    qaratms_translate_ru
    php.ini
    php-qaratms.ini
    php-fpm.conf
    php-fpm-qaratms.conf
    nginx-qaratms.conf
    nginx.conf
    env_sqlite
    qaratms-nginx.service
    qaratms-php-fpm.service
    qaratms.slice
    resources-lang-ru.json
    resources-lang-ru-auth.php
    resources-lang-ru-pagination.php
    resources-lang-ru-passwords.php
    resources-lang-ru-validation.php
)
sha256sums=('SKIP'
            '8015aa9b66701b115fa60a82971371a7877072401de3067cbe50540756322f27'
            'c75d19df56796bb7a5bb7b802b5c4c49629b2dee2b0ff46d1a112f58bd74ee2c'
            '64e275d4fcf03d2bc980f933b9c9516d4fe1818362f597d1aeaca276880203eb'
            '92b6fc4e278840b2eaca32d9e664c8fe72ee0dbe57faefd14df2419137fa2a1e'
            '98e7f97eaf958aeecef1bc1846b074f12e020c4535182db0bcc5387950231655'
            'f6f8035e644112594cee8192549a029273286ea710786083f9f492aa3b66a868'
            '27056beffebefd70c5c42a2bcaf1bd839a631f46cd8a301d19570cfed0f4f23e'
            '4b325c37df240dd4070ebc1a8600f541fb537e638e97d742aaf59614f4d7f1b3'
            '613da96c515e8a045737998c6338168ee745a50e117fee7e389022e02786bc82'
            '5631b578c2a4950954bbccc7bd9937e5e1fed5b995a61acddb36116538765bb6'
            '7492537372caf9a156b4d8b75bcfa39ed1c0bfc97aac9d09f54732adbd9e3214'
            '553be98f0ff068b269a8dd8e9f9a87b31e618281f7f883b4b15c047ef2e168ff'
            'c3295b39f264573b75f0a10920c1d096ff1c75e3ef25518b471e535b9807e73b'
            'd9c9e124273c3619dc701251752cdb8b063ad425e1326a11e92099440a43ff3a'
            'b3d2443a269c14fec1bbeb29b2615ce007e0c5ecc2e421759cee9be9740fbb40'
            '90956905af02a1027a7bd37b99f414c2c3ff54a85e449c01071fa39a5103aaea')

prepare(){
    cd "${srcdir}/${_pkgbase}"
    git checkout ${commit_dc9c8fe}
    true > "database/database.sqlite"
    cp -a ".env_sqlite.backup" ".env"
    composer install
    #php artisan key:generate
    #
    export PHP_INI_SCAN_DIR="${srcdir}"
    php -c "${srcdir}/php.ini" artisan key:generate
    php -c "${srcdir}/php.ini" artisan cache:clear
    php -c "${srcdir}/php.ini" artisan config:clear
    php -c "${srcdir}/php.ini" artisan view:clear
    php -c "${srcdir}/php.ini" artisan optimize:clear
    #
    
    php -c "${srcdir}/php.ini" artisan migrate
    php -c "${srcdir}/php.ini" artisan db:seed --class=AdminSeeder
    git pull origin ${commit_20240814}
    #git pull origin HEAD
    composer install
    
}

_package(){
    cd "${srcdir}/${_pkgbase}"
    install -dm755 ${pkgdir}/opt/${_pkgbase}
    cp -a -t ${pkgdir}/opt/${_pkgbase} \
	app \
	bootstrap \
	config \
	database \
	public \
	resources \
	routes \
	storage \
	tests \
	vendor 
    install -Dm644 -t ${pkgdir}/opt/${_pkgbase} \
	artisan \
	composer.json \
	composer.lock \
	LICENSE \
	package.json \
	package-lock.json \
	phpunit.xml \
	server.php \
	webpack.mix.js
    install -Dm644 -t ${pkgdir}/opt/${_pkgbase}/example_env \
	.env.backup \
	.env_docker \
	.env_sqlite.backup \
	.env.testing
    install -Dm644 -t ${pkgdir}/opt/${_pkgbase}/example_db \
	${pkgdir}/opt/${_pkgbase}/database/database.sqlite
#    rm -f ${pkgdir}/opt/${_pkgbase}/database/database.sqlite

    install -Dm644 "${srcdir}/php.ini"		    "${pkgdir}/opt/${_pkgbase}/etc/php/php.ini"
    install -Dm644 "${srcdir}/php-qaratms.ini"	    "${pkgdir}/opt/${_pkgbase}/etc/php/conf.d/qaratms.ini"
    install -Dm644 "${srcdir}/php-fpm.conf"	    "${pkgdir}/opt/${_pkgbase}/etc/php/php-fpm.conf"
    install -Dm644 "${srcdir}/php-fpm-qaratms.conf" "${pkgdir}/opt/${_pkgbase}/etc/php/php-fpm.d/qaratms.conf"
    install -Dm644 "${srcdir}/nginx.conf"	    "${pkgdir}/opt/${_pkgbase}/etc/nginx/nginx.conf"
    install -Dm644 "${srcdir}/nginx-qaratms.conf"   "${pkgdir}/opt/${_pkgbase}/etc/nginx/sites-available.d/qaratms"
    install -dm755 "${pkgdir}/opt/${_pkgbase}/etc/nginx/conf.d"
    install -dm755 "${pkgdir}/opt/${_pkgbase}/etc/nginx/sites-enabled.d"
    ln -s "../sites-available.d/qaratms" "${pkgdir}/opt/${_pkgbase}/etc/nginx/sites-enabled.d/qaratms"
    install -Dm644 "${srcdir}/env_sqlite"	    "${pkgdir}/opt/${_pkgbase}/.env"
    chown -R http:http "${pkgdir}/opt/${_pkgbase}"
    chmod -R 755 "${pkgdir}/opt/${_pkgbase}/storage"
    
    install -Dm644 "${srcdir}/qaratms-nginx.service"   	"${pkgdir}/usr/lib/systemd/system/qaratms-nginx.service"
    install -Dm644 "${srcdir}/qaratms-php-fpm.service"  "${pkgdir}/usr/lib/systemd/system/qaratms-php-fpm.service"
    install -Dm644 "${srcdir}/qaratms.slice"   		"${pkgdir}/usr/lib/systemd/system/qaratms.slice"

    #php artisan serve --host=0.0.0.0 --port=8080
}

_package_en(){
    true
}

_package_ru(){
    # Localization
    install -Dm644 "${srcdir}/resources-lang-ru.json"   	"${pkgdir}/opt/${_pkgbase}/resources/lang/ru.json"
    install -Dm644 "${srcdir}/resources-lang-ru-auth.php"   	"${pkgdir}/opt/${_pkgbase}/resources/lang/ru/auth.php"
    install -Dm644 "${srcdir}/resources-lang-ru-pagination.php" "${pkgdir}/opt/${_pkgbase}/resources/lang/ru/pagination.php"
    install -Dm644 "${srcdir}/resources-lang-ru-passwords.php"  "${pkgdir}/opt/${_pkgbase}/resources/lang/ru/passwords.php"
    install -Dm644 "${srcdir}/resources-lang-ru-validation.php" "${pkgdir}/opt/${_pkgbase}/resources/lang/ru/validation.php"

    sed -E "s/(APP_LOCALE)=.*/\1=${pkg_lang}/" -i "${pkgdir}/opt/${_pkgbase}/.env"
    # https://github.com/summernote/summernote/tree/v0.8.18/dist/lang
    summernote_ver=$(sed -Ern 's/.*version:"([[:digit:].]+)".*/\1/p' public/editor/summernote-lite.min.js) #'"
    summernote_url="https://github.com/summernote/summernote/raw/v${summernote_ver}/dist/lang/summernote-${pkg_lang,,}-${pkg_lang^^}.min.js"
    wget --directory-prefix="${pkgdir}/opt/${_pkgbase}/public/editor/" "${summernote_url}" || true
    [[ -e ${srcdir}/qaratms_translate_${pkg_lang,,} ]] && ${srcdir}/qaratms_translate_${pkg_lang,,} --quiet ${pkgdir}/opt/${_pkgbase} || true
}

main() {
    for _pkgname in "${pkgname[@]}"; do
        pkg_lang=${_pkgname##*-}
	eval "package_${_pkgname}(){
            conflicts=("${_pkgname}-git")
            install=${pkgbase}.install
            pkgdesc=\"QaraTMS is open source test case, test suites, test plans and test runs management tool. ${pkg_lang^^} locale\"
            
            _package
            _package_${pkg_lang,,}
	    
        }"
    done
}

main
