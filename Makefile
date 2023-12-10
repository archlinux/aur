# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share

FILES=$(wildcard mediascan)

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(FILES)

install:

	install -vDm 755 aspe "$(BIN_DIR)/mediascan"

.PHONY: check install shellcheck
