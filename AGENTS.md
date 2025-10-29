# AGENT CODING GUIDELINES

This repository is a Rust project. Adhere to standard Rust conventions and use Cargo for all operations.

## 1. Commands

| Action | Command | Notes |
| :--- | :--- | :--- |
| **Build** | `cargo build` | Use `--release` for production builds. |
| **Test All** | `cargo test` | Runs all unit and integration tests. |
| **Test Single** | `cargo test <test_name>` | Run a specific test function. |
| **Format** | `cargo fmt` | Automatically formats code using rustfmt. |
| **Lint** | `cargo clippy` | Runs the standard Rust linter. |

## 2. Code Style & Conventions

*   **Formatting:** Enforce with `cargo fmt`.
*   **Naming:** Use `snake_case` for functions, variables, and modules. Use `UpperCamelCase` for types (structs, enums, traits).
*   **Imports:** Group `use` statements: standard library, external crates, local modules. Prefer absolute paths.
*   **Error Handling:** Use `Result<T, E>` for recoverable errors and the `?` operator for propagation. Avoid `unwrap()` or `expect()` in production code.
*   **Comments:** Use `///` for documentation comments and `//` for internal code comments.
