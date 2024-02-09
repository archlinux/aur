# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="superset"
_pkgname="apache-superset"
pkgver=3.1.0
pkgrel=4
pkgdesc="A modern, enterprise-ready business intelligence web application"
url="https://superset.apache.org/"
license=("Apache-2.0")
arch=("any")
options=("!strip")
makedepends=("python-build"
             "python-installer"
             "python-wheel"
             "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "superset_config.py::https://raw.githubusercontent.com/apache/$pkgname/master/$pkgname/config.py"
        "$pkgname.env"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.service"
        "$pkgname.socket")
b2sums=('436e72d5940e9272a98d14e225709fadbd9a44e1c06ffaf8b315ba15d9a5273182c7dee665ecc5b84d66adf710e8a1aa5f8248a78c48e49dd3ec6c85c8fd93f1'
        'e80f52a1ac56134c0778e1e3910a441ef25e63405c0c80dcc0432e0802888ac350d232d3d8c75f3530fdee52110f610a3cbb55431acc7cb50ad8ae4ef6812269'
        '337bc95eefa8df30878079ee72d8db576886389e14542f573e7a794d0286e02309a310b17aa5bd8f666e41120bd244f5d63aade68d4412f9b6ee3e6443883e13'
        '85a1d4232a1901d00becf06ef5cbf139477209b93f3738add436f4243aa58d1b16a99dd6342c9f45f4b4efd2e10db337525d183f7f27c708420df406f31e6e09'
        '8dbdfb25b18ba216859da758d24a537d07733e4710af5983a26fc38964f56b880a5201b6ea17ffc2c1b3befe4e40244c7bdbbae2b4e94eb1bc110256ac059db3'
        '979cb488b91c1b9d7dfbb6583096ccf01137dcba58399c4c1d2cc407038b70a76629d2c0d79612caaa29e89f2bb254f4800079bb8d9de69376603e5356e734c9'
        '8657f36d073ddfa3001a7be35569781975f3ba46b68d299cf67ab7dd258fad4aaa796d6a7dab78d85a77d31049b9a581053027300baefaf126236e5714aed175')
backup=("etc/$pkgname/env"
        "etc/$pkgname/superset_config.py")
install="$pkgname.install"

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -d "$pkgdir/etc/$pkgname"
 install -d "$pkgdir/var/lib/$pkgname" 
 install -D -m 640 "$srcdir/$pkgname.env"       "$pkgdir/etc/$pkgname/env"
 install -D -m 640 "$srcdir/superset_config.py" "$pkgdir/etc/$pkgname/superset_config.py"
 install -D -m 644 "$srcdir/$pkgname.sysusers"  "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
 install -D -m 644 "$srcdir/$pkgname.tmpfiles"  "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
 install -D -m 644 "$srcdir/$pkgname.service"   "$pkgdir/usr/lib/systemd/system/$pkgname.service"
 install -D -m 644 "$srcdir/$pkgname.socket"    "$pkgdir/usr/lib/systemd/system/$pkgname.socket"
}

# automatic dependencycheck:
#   source PKGBUILD && yay -S ${depends[@]}

# interactive dependency check:
#   yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S

# python conversion for setup.py required dependencies:
: '
import re
def process_list(dependencies):
    print("depends=(")
    for dependency_py in dependencies:
        dependency_arch = "python-" + re.sub(r"(python-|\[.*\]|>.*|=.*)", "", dependency_py.lower())
        print(f'"{dependency_arch}"')
    print(")")

process_list(install_requires)
'

# python conversion for setup.py optional dependencies:
: '
import re
def process_dictionary(dictionary):
    print("optdepends=(")
    for feature, dependencies in extras_require.items():
        print(f"# {feature}")
        for dependency_py in dependencies:
            dependency_arch = "python-" + re.sub(r"(\s+|python-|\[.*\]|>.*|=.*)", "", dependency_py.lower())
            print(f'"{dependency_arch}: for {feature}"')
        print(f"")
    print(")")

process_dictionary(extras_require)
'

depends=(
"python-backoff"
"python-celery"
"python-click"
"python-click-option-group"
"python-colorama"
"python-croniter"
"python-cron-descriptor"
"python-cryptography"
"python-deprecation"
"python-flask"
"python-flask-appbuilder"
"python-flask-caching"
"python-flask-compress"
"python-flask-talisman"
"python-flask-login"
"python-flask-migrate"
"python-flask-session"
"python-flask-wtf"
"python-func_timeout"
"python-geopy"
"gunicorn" # manual fix
"python-hashids"
"python-holidays"
"python-humanize"
"python-importlib-metadata" # manual fix
"python-isodate"
"python-mako" # manual fix
"python-markdown"
"python-msgpack"
"python-nh3"
"python-numpy"
"python-packaging"
"python-pandas"
"python-parsedatetime"
"python-pgsanity"
"python-polyline"
"python-pyparsing"
"python-dateutil" # manual fix
"python-dotenv" # manual fix
"python-geohash" # manual fix
"python-pyarrow"
"python-pyyaml"
"python-pyjwt" # manual fix
"python-redis"
"python-selenium"
"python-shillelagh"
"python-shortid"
"python-sshtunnel"
"python-simplejson"
"python-slack-sdk" # manual fix
"python-sqlalchemy"
"python-sqlalchemy-utils"
"python-sqlparse"
"python-tabulate"
"python-typing-extensions"
"python-werkzeug"
"python-wtforms"
"python-wtforms-json"
"python-xlsxwriter"
)

optdepends=(
# athena
#"python-pyathena: for athena" # MISSING

# aurora-data-api
#"python-preset-sqlalchemy-aurora-data-api: for aurora-data-api" # MISSING

# bigquery
#"python-pandas-gbq: for bigquery" # MISSING
#"python-sqlalchemy-bigquery: for bigquery" # MISSING
#"python-google-cloud-bigquery: for bigquery"

# clickhouse
"python-clickhouse-connect: for clickhouse"

# cockroachdb
#"python-cockroachdb: for cockroachdb" # MISSING

# cors
"python-flask-cors: for cors"

# crate
"python-crate: for crate"

# databend
#"python-databend-sqlalchemy: for databend" # MISSING

# databricks
#"python-databricks-sql-connector: for databricks" # MISSING
#"python-sqlalchemy-databricks: for databricks"

# db2
"python-ibm-db-sa: for db2"

# dremio
#"python-sqlalchemy-dremio: for dremio" # MISSING

# drill
#"python-sqlalchemy-drill: for drill" # MISSING

# druid
"python-pydruid: for druid"

# duckdb
"python-duckdb: for duckdb" # manual edit

# dynamodb
#"python-pydynamodb: for dynamodb" # MISSING

# solr
#"python-sqlalchemy-solr: for solr" # MISSING

# elasticsearch
#"python-elasticsearch-dbapi: for elasticsearch" # MISSING

# exasol
#"python-sqlalchemy-exasol: for exasol" # MISSING

# excel
"python-xlrd: for excel"

# firebird
#"python-sqlalchemy-firebird: for firebird" # MISSING

# firebolt
#"python-firebolt-sqlalchemy: for firebolt" # MISSING

# gsheets
#"python-shillelagh: for gsheets" # MISSING

# hana
#"python-hdbcli: for hana" # MISSING
#"python-sqlalchemy_hana: for hana" # MISSING

# hive
#"python-pyhive: for hive" # MISSING
#"python-pyhive: for hive" # MISSING
#"python-tableschema: for hive"
#"python-thrift: for hive"

# impala
#"python-impyla: for impala" # MISSING

# kusto
#"python-sqlalchemy-kusto: for kusto" # MISSING

# kylin
#"python-kylinpy: for kylin" # MISSING

# mssql
"python-pymssql: for mssql"

# mysql
"python-mysqlclient: for mysql"

# ocient
#"python-sqlalchemy-ocient: for ocient" # MISSING
#"python-pyocient: for ocient" # MISSING
#"python-shapely: for ocient"
#"python-geojson: for ocient"

# oracle
"python-cx-oracle: for oracle"

# pinot
#"python-pinotdb: for pinot" # MISSING

# playwright
"python-playwright: for playwright"

# postgres
"python-psycopg2: for postgres"

# presto
#"python-pyhive: for presto" # MISSING

# trino
#"python-trino: for trino" # MISSING

# prophet
#"python-prophet: for prophet" # MISSING

# redshift
#"python-sqlalchemy-redshift: for redshift" # MISSING

# rockset
#"python-rockset-sqlalchemy: for rockset" # MISSING

# shillelagh
#"python-shillelagh: for shillelagh" # MISSING

# snowflake
#"python-snowflake-sqlalchemy: for snowflake" # MISSING

# spark
#"python-pyhive: for spark" # MISSING
#"python-pyhive: for spark" # MISSING
#"python-tableschema: for spark"
#"python-thrift: for spark"

# teradata
#"python-teradatasql: for teradata" # MISSING

# thumbnails
"python-pillow: for thumbnails"

# vertica
#"python-sqlalchemy-vertica-python: for vertica" # MISSING

# netezza
#"python-nzalchemy: for netezza" # MISSING

# starrocks
#"python-starrocks: for starrocks" # MISSING

# doris
#"python-pydoris: for doris" # MISSING

)
