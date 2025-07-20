.DEFAULT_GOAL := run

.PHONY: build run test fmt clippy clean release install uninstall

BINARY_NAME = guessgame

# Auto-detect install target based on UID
ifeq ($(shell id -u),0)
INSTALL_DIR = /usr/local/bin
else
INSTALL_DIR = $(HOME)/.local/bin
endif

build:
	cargo build

run:
	cargo run

test:
	cargo test

fmt:
	cargo fmt

clippy:
	cargo clippy --all-targets --all-features -- -D warnings

clean:
	cargo clean

release:
	cargo build --release

install: release
	install -Dm755 target/release/$(BINARY_NAME) $(INSTALL_DIR)/$(BINARY_NAME)

uninstall:
	rm -f $(INSTALL_DIR)/$(BINARY_NAME)
