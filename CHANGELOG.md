# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 0.9.1 (24. Jan, 2026)

- **Added:** Introduced an optional `swagger-ui` feature flag (enabled by default). Users can now disable it (`--no-default-features`) to exclude web assets and reduce binary size for lightweight deployments.
- **Changed:** Refactored the internal API routing structure. The root path `/` now redirects to `/swagger-ui` (when enabled), while the system information endpoint has been moved to `/system`.
- **Changed:** Optimized the Docker CI pipeline to use pre-built artifacts from the Linux build job, reducing multi-architecture build times from ~60m to ~1m.
- **Changed:** OpenAPI documentation now automatically synchronizes its version with the `Cargo.toml` package version.
- **Fixed:** Resolved `unused import` warnings and parsing errors in the API router when compiling with minimal feature sets.
- **Fixed:** Corrected integration test failures related to environment variable leakage and API status code changes (`201 Created`).

## 0.9.0 (23. Jan, 2026)

- **Breaking:** Re-architected the internal API structure. Legacy endpoints have been migrated to domain-specific handlers (`system`, `ports`, `config`, `plugins`), changing the internal routing layout.
- **Breaking:** Changed the default configuration directory on Unix-like systems from `~/vane/` to `/etc/vane/` to align with production standards. Windows now defaults to `C:\ProgramData\Vane\`.
- **Added:** Integrated `utoipa` to provide full OpenAPI (Swagger) documentation, accessible via `/swagger-ui`.
- **Added:** Implemented strict Request/Response Schemas in `src/api/schemas/` to ensure robust API contracts.
- **Added:** New Configuration Management APIs: implemented `reload`, `export`, and a safe `import` (restore mode) that recursively cleans existing configs before restoration.
- **Added:** Implemented initial support for the Windows platform, including adaptive memory management via `wmic`.
- **Changed:** Migrated legacy `ingress` API logic to the new `api/handlers/ports` module.
- **Changed:** Refactored global path handling to use platform-specific separators and standard system directories.
- **Fixed:** Resolved `axum` 0.8 compatibility issues by replacing root nesting with router merging.
- **Fixed:** Resolved a stack overflow issue during OpenAPI schema generation caused by recursive plugin instance structures.
- **Fixed:** Resolved cross-platform compatibility issues by gating Unix-specific paths and socket IPC logic.

## 0.8.15 (22. Jan, 2026)

- **Added:** Implemented comprehensive CI/CD pipelines for automated publishing to Docker Hub, GitHub Container Registry (GHCR), AUR, and Crates.io using Trusted Publishing.
- **Changed:** Upgraded `reqwest` to v0.13 and refactored TLS feature flags. Explicitly decoupled `aws-lc-rs` and `ring` backends to ensure correct dependency resolution across all platforms.
- **Fixed:** Resolved a critical linking error on NetBSD by preventing `aws-lc-sys` from being pulled into `ring`-based builds.
- **Fixed:** Optimized `Dockerfile` with dependency layer caching and conditional proxy support, significantly speeding up incremental builds.
- **Fixed:** Resolved `no method named danger_accept_invalid_certs` compilation error when building with the `ring` feature.

## 0.8.14 (21. Jan, 2026)

- **Added:** Introduced comprehensive test coverage for QUIC protocol handling, including multi-frame and cross-packet scenarios, ensuring robust stream reassembly.
- **Added:** Implemented new decoding tests for TLS ClientHello and internal static server tools to verify correctness of handshake parsing.
- **Changed:** Refined validation logic for plugin names and adjusted regex patterns to better align with internal naming conventions.
- **Fixed:** Massive codebase cleanup and optimization. Resolved over 1.4k+ clippy warnings and lint errors, including fixing memory safety patterns, optimizing string allocations, and standardizing error handling across all modules.
- **Fixed:** Corrected `is_private_ipv4` logic to strictly adhere to IANA reserved ranges, now correctly identifying `0.0.0.0/8` (Current Network) and documentation ranges as non-public.
- **Fixed:** Resolved a fallback logic error in the external plugin execution driver, ensuring consistent behavior when external processes fail or timeout.

## 0.8.13 (3. Jan, 2026)

- **Changed:** Refactored `KvStore` to use `ahash::AHashMap`, providing significantly faster variable lookups and template resolutions on modern CPUs with AES instruction sets.
- **Changed:** Updated internal transport contexts to utilize high-performance hashing for transient payload storage.

## 0.8.12 (3. Jan, 2026)

- **Changed:** Significant optimization of the UDP data path by replacing `Vec<u8>` with `bytes::Bytes`.
- **Changed:** Switched the core `ConnectionObject::Udp` payload type to `Bytes`, enabling zero-copy propagation of datagrams from the listener down to terminators and carriers.
- **Changed:** Refactored the QUIC carrier and session management to utilize reference-counted `Bytes` for packet buffering and reassembly, eliminating redundant heap allocations and memory copies in the hot path.
- **Changed:** Updated the QUIC Muxer and Virtual Socket to accept `Bytes` directly, streamlining the handover to the L7 H3 engine.

## 0.8.11 (3. Jan, 2026)

- **Changed:** Implemented **Lazy Hex Encoding** (Task 7.2) for L4+ carrier data. Raw payloads (TLS ClientHello, QUIC Initial) are now stored as bytes and only converted to hex strings if explicitly requested by a template, significantly reducing CPU and memory overhead for most connections.

## 0.8.10 (3. Jan, 2026)

- **Added:** Integrated CGI response streaming into the adaptive memory quota system. Vane now tracks and limits memory usage for transient CGI output buffers, preventing OOM during large or slow script executions.
- **Changed:** Refactored `CgiResponseBody` to use RAII `QuotaBytes`, ensuring that memory allocated for streaming chunks is automatically released back to the global pool once consumed by the client.
- **Fixed:** Hardened the "Fail-Fast" allocation policy to cover edge cases in directory browsing and CGI initial data fragments.

## 0.8.9 (3. Jan, 2026)

- **Added:** Implemented a **Smart Handshake Peek Loop** in the TLS carrier. Vane now intelligently waits for the full `ClientHello` record (up to `TLS_HANDSHAKE_PEEK_TIMEOUT_MS`, default 500ms), eliminating connection drops caused by network fragmentation.
- **Added:** Introduced detailed error reporting for TLS failures. Injected `tls.error` keys (e.g., `incomplete`, `malformed`, `timeout`, `buffer_too_small`) into the KV store to enable precise Flow branching.
- **Changed:** Implemented strict **SNI Normalization**. Extracted Server Name Indication values are now automatically converted to lowercase and filtered to contain only standard alphanumeric, dot, hyphen, and underscore characters, preventing matching bypasses and injection risks.

## 0.8.8 (2. Jan, 2026)

- **Added:** New environment variables: `L7_ADAPTIVE_MEMORY_LIMIT` (default: `true`), `L7_ADAPTIVE_MEMORY_RATIO` (default: `85`), and `L7_GLOBAL_BUFFER_LIMIT` (default: 512MB).
- **Changed:** Vane now performs real-time monitoring of system free memory (on Linux, macOS, and FreeBSD) to dynamically adjust the maximum allowed memory for L7 buffering (`force_buffer`).
- **Changed:** Implemented a "Fail-Fast" allocation policy: when the memory quota is exceeded, new buffering requests (e.g., triggered by `{{req.body}}` templates) are denied to protect process stability.
- **Changed:** Enhanced `PayloadState` with RAII resource tracking to ensure precise global memory accounting across connection lifecycles.

## 0.8.7 (2. Jan, 2026)

- **Added:** Introduced `STREAM_IDLE_TIMEOUT_SECS` environment variable (default: 10s) to control the maximum allowed inactivity period for proxied streams.
- **Changed:** Refactored the proxy engine to use a high-performance **Watchdog Wrapper Stream**. This mechanism enables zero-copy idle detection without impacting the efficiency of `tokio::io::copy`.

## 0.8.6 (2. Jan, 2026)

- **Added:** Introduced four new opt-in security switches: `ALLOW_EXTERNAL_LINKER_ENV`, `ALLOW_EXTERNAL_RUNTIME_ENV`, `ALLOW_EXTERNAL_SHELL_ENV`, and `ALLOW_EXTERNAL_PATH_ENV_APPEND` (all default to `false`).
- **Changed:** External command plugins now have dangerous environment variables (e.g., `LD_PRELOAD`, `PYTHONPATH`, `IFS`) filtered out by default unless explicitly permitted via the new switches.
- **Changed:** When `ALLOW_EXTERNAL_PATH_ENV_APPEND` is enabled, user-provided `PATH` values are safely appended to the system `PATH` instead of replacing it entirely.

## 0.8.5 (2. Jan, 2026)

- **Changed:** Vane now actively terminates TLS connections if the `ClientHello` cannot be peeked or parsed, ensuring that SNI-based routing/filtering cannot be bypassed.
- **Changed:** When allowed to continue after a parse failure (via `TLS_ALLOW_PARSE_FAILURE=true`), the SNI is explicitly set to `unknown` to allow downstream Flow logic to handle the exception gracefully.

## 0.8.4 (2. Jan, 2026)

- **Added:** Introduced `GLOBAL_PENDING_BYTES` accounting with a configurable limit (`QUIC_GLOBAL_PENDING_BYTES_LIMIT`, default 64MB) to prevent memory exhaustion attacks via flooded Initial packets.
- **Added:** Enforced per-session buffering limits (`QUIC_SESSION_BUFFER_LIMIT`, default 64KB) to restrict the memory footprint of individual pending handshakes waiting for SNI reassembly.
- **Changed:** Refactored `PendingState` to implement `Drop` (RAII), ensuring that global byte quotas are automatically released whenever a session state is processed, timed out, or discarded.
- **Changed:** Introduced a safe `drain_queue()` mechanism for `PendingState` to handle data extraction under the new `Drop` semantics, maintaining strict resource accounting consistency.

## 0.8.3 (2. Jan, 2026)

- **Changed:** Major architectural reorganization of the plugin system and network stack to improve maintainability and separate concerns.
- **Changed:** Modularized `src/modules/plugins/` into four specialized sub-directories: `core/` (infrastructure), `middleware/` (logic), `terminators/` (endpoints), and `l7/` (drivers).
- **Changed:** Flattened the network stack by removing the redundant `protocol/` layer. Moved `carrier/` (L4+) and `application/` (L7) directly under `src/modules/stack/`.
- **Changed:** Standardized plugin file organization by merging standalone `plugin.rs` and `static.rs` files into their respective `mod.rs` entry points.
- **Changed:** Updated all internal and external import paths to reflect the new modular structure while maintaining full functional compatibility.
- **Fixed:** Resolved naming conflicts in the CGI module introduced during code merging.

## 0.8.2 (2. Jan, 2026)

- **Changed:** Removed `anynet` dependency and associated `DETECT_PUBLIC_NETWORK` environment variable. Startup is now more focused and lightweight.
- **Changed:** Relaxed `deny.toml` to allow common transitive duplicates while maintaining strict security for core components.
- **Fixed:** Resolved a significant dependency version duplication issue. By removing unused `nom 8` and legacy `anynet` stack, Vane now uses a unified dependency tree, improving compilation speed and reducing binary size.

## 0.8.1 (2. Jan, 2026)

- **Changed:** Optimized the dependency tree by making most of heavy libraries optional, significantly reducing minimal build size.
- **Fixed:** Resolved CGI `PATH_INFO` and `SCRIPT_NAME` derivation edge cases. Implemented segment-based splitting and path normalization to strictly adhere to RFC 3875.

## 0.8.0 (2. Jan, 2026)

- **Added:** Comprehensive support for modular Rust Feature Flags. Users can now customize the binary by enabling/disabling 13 core features: `tcp`, `udp`, `tls`, `quic`, `httpx`, `h2upstream`, `h3upstream`, `cgi`, `static`, `ratelimit`, `domain-target`, `http-console`, and `unix-console`.
- **Added:** Binary now displays the complete list of enabled features when running `vane -v` or `--version`.
- **Changed:** Enhanced Flow Validator to detect disabled features. If a configuration uses a plugin, protocol, or domain-target that was not compiled in, Vane now provides a descriptive error message explaining which feature needs to be enabled.

## 0.7.20 (2. Jan, 2026)

- **Added:** Implemented Cycle Detection in the flow engine validator to prevent infinite loops in configuration.
- **Changed:** Enhanced error reporting for configuration failures with precise path tracing (e.g., `[plugin_a -> plugin_b.input.param_x]`).
- **Fixed:** Completely refactored the Flow Validation Framework. Eliminated all `Box::leak` calls in configuration validators, achieving memory safety during hot-reloads.

## 0.7.19 (1. Jan, 2026)

- **Added:** Implemented Global Connection Rate Limits. Introduced two new environment variables `MAX_CONNECTIONS` (default: 10000) and `MAX_CONNECTIONS_PER_IP` (default: 50) to enforce concurrency limits at the L4/L4+ layer.
- **Changed:** Integrated connection tracking into TCP listeners, UDP sessions (Legacy & Flow), and QUIC session management. Utilizing RAII guards to ensure precise and automatic resource counting across configuration hot-reloads.

## 0.7.18 (1. Jan, 2026)

- **Changed:** Completed full migration to Asynchronous I/O across the entire codebase. Replaced all remaining `std::fs` calls with `tokio::fs` in core loading engines, certificate management, management API, and plugin persistence.
- **Changed:** Eliminated potential worker thread blocking during configuration hot-reloads and environment initialization, ensuring consistent low latency under disk I/O pressure.
- **Fixed:** Refactored the internal port listener lifecycle to support asynchronous binding and graceful task handovers.
- **Fixed:** Replaced potential panic points in the WebSocket builder, config watcher initialization, and regex compilation with robust error handling and logging, ensuring 100% panic safety in the data plane.

## 0.7.17 (1. Jan, 2026)

- **Changed:** Optimized QUIC packet parsing by eliminating redundant heap allocations and data clones during CRYPTO frame reassembly. Refactored the internal data structures to use `BTreeMap` for zero-copy fragment merging, significantly improving performance in high-latency or high-jitter handshake scenarios.
- **Fixed:** Cleaned up deprecated QUIC parser legacy code to streamline the codebase.

## 0.7.16 (1. Jan, 2026)

- **Changed:** Optimized the Rate Limiter's memory management by introducing precise, incremental atomic counters for heap usage tracking. This replaces the previous rough estimations with O(1) complexity monitoring, ensuring reliable memory bounds and better protection against resource exhaustion attacks.

## 0.7.15 (1. Jan, 2026)

- **Fixed:** Eliminated usage of `unreachable!()` and `panic!()` in the data plane and certificate management modules. Vane now utilizes explicit error results to handle internal state inconsistencies and unsupported key formats, ensuring that logic errors result in controlled connection drops rather than thread-level crashes.

## 0.7.14 (30. Dec, 2025)

- **Fixed:** Systematically enhanced panic safety across the data plane and bootstrap process by replacing unsafe `unwrap()` and `expect()` calls with robust error handling.
- **Fixed:** Improved reliability of the QUIC carrier, HTTPX adapter, and Command/CGI drivers by ensuring graceful error propagation and proactive resource cleanup during runtime failures.
- **Fixed:** Hardened the Static resource plugin and Certificate loader against malformed inputs and system clock inconsistencies.
- **Fixed:** Refactored the global QUIC upstream endpoint to use async initialization, eliminating potential panics during startup if network resources are unavailable.

## 0.7.13 (30. Dec, 2025)

- **Added:** Implemented a global execution timeout for the Flow Engine (default: 10s, configurable via `FLOW_EXECUTION_TIMEOUT_SECS`). This prevents worker thread starvation and resource exhaustion caused by hanging external plugins or network requests.
- **Fixed:** Hardened external drivers (Command, Unix, HTTP) with explicit timeout enforcement and child process cleanup (auto-kill on timeout) to ensure zero resource leakage during execution failures.

## 0.7.12 (30. Dec, 2025)

- **Fixed:** Implemented comprehensive protection against template injection. Vane now strictly validates resolved key names and prohibits the use of template syntax (`{` or `}`) within KV store keys. Any attempt to resolve a key containing these characters will be intercepted and logged as a security violation, returning the original text instead of performing a lookup.

## 0.7.11 (30. Dec, 2025)

- **Fixed:** Implemented complexity protection in the template parser. Vane now enforces maximum recursion depth (default: 5) and total AST node limits (default: 50) during template parsing to prevent Denial-of-Service attacks via maliciously crafted configuration strings.

## 0.7.10 (30. Dec, 2025)

- **Added:** Implemented a "Passive Circuit Breaker" for external plugins. Vane now automatically detects runtime IO failures and enforces a quiet period (default: 3s, configurable via `EXTERNAL_PLUGIN_QUIET_PERIOD_SECS`) to skip further attempts and instantly trigger failure branches, significantly improving reliability and responsiveness during external middleware outages.

## 0.7.9 (30. Dec, 2025)

- **Fixed:** Resolved a critical race condition in the QUIC carrier engine during SNI reassembly. Introduced an atomic processing flag and extended lock scopes to prevent redundant flow executions for concurrent fragments.
- **Fixed:** Implemented self-cleanup protection for fragmented QUIC packets. Vane now limits the number of pending packets per session (default: 5, configurable via `QUIC_MAX_PENDING_PACKETS`) to prevent memory exhaustion from incomplete handshakes.

## 0.7.8 (30. Dec, 2025)

- **Fixed:** Enhanced configuration loader security by implementing mandatory path canonicalization and prefix validation. Vane now ensures all configuration files reside within the trusted configuration directory, effectively preventing path traversal and symlink-based attacks.

## 0.7.7 (30. Dec, 2025)

- **Changed:** Refactored the configuration loading logic to eliminate TOCTOU (Time-of-Check to Time-of-Use) race conditions. Vane now performs atomic file reads and handles errors via a new `LoadResult` enum.
- **Changed:** Enhanced the Keep-Last-Known-Good (KLKG) strategy across all modules (Ports, Resolvers, Applications, Nodes). The system now explicitly distinguishes between intentional configuration removal (triggering an unload) and corrupted configuration updates (preserving the previous valid state), ensuring high availability during maintenance.

## 0.7.6 (30. Dec, 2025)

- **Fixed:** Implemented template result size protection. The resolution engine now enforces a maximum string length (default: 64KB, configurable via `MAX_TEMPLATE_RESULT_SIZE`) to prevent potential Out-of-Memory (OOM) attacks from malicious or oversized template configurations.

## 0.7.5 (30. Dec, 2025)

- **Fixed:** Implemented template and JSON recursion depth protection. The resolution engine now enforces a strict depth limit (default: 5, configurable via `MAX_TEMPLATE_DEPTH`) to prevent Denial-of-Service attacks via malicious nested configurations or infinite loops.

## 0.7.4 (30. Dec, 2025)

- **Fixed:** Resolved a critical command injection vulnerability in the external command driver. Vane now enforces a "Trusted Bin Root" policy, restricting external plugin execution to programs located within the `$CONFIG_DIR/bin/` directory. All paths are strictly validated and canonicalized during registration and execution to prevent unauthorized system access.

## 0.7.3 (30. Dec, 2025)

- **Changed:** Optimized flow path and scoped key generation by implementing manual string buffer management with pre-calculated capacities. This eliminates redundant heap allocations and avoids `format!` macro overhead in high-frequency execution paths.

## 0.7.2 (30. Dec, 2025)

- **Fixed:** Optimized the Flow Engine executor to eliminate redundant `HashMap` clones during plugin dispatch. By implementing move-aware recursive execution, Vane now significantly reduces heap allocations and CPU overhead in complex traffic pipelines.

## 0.7.1 (30. Dec, 2025)

- **Fixed:** Resolved a critical memory leak in the QUIC carrier engine by implementing a background cleanup task for Connection ID, Initial packet buffer, and IP stickiness registries (configurable via `QUIC_SESSION_TTL_SECS`).

## 0.7.0 (30. Dec, 2025)

- **Breaking:** Implemented mandatory authentication for the management API and console. Vane now requires the `ACCESS_TOKEN` environment variable to be set (16-128 chars). All API requests must include the `Authorization: Bearer <token>` header. If the token is not set, the management interface is disabled for security.
- **Added:** Introduced a new authentication middleware to protect all management endpoints.
- **Changed:** Optimized the core bootstrap sequence to eliminate a 2.2-second artificial delay. Business listeners now initialize immediately after configuration loading.
- **Changed:** Refactored the `requirements` module to clearly separate synchronous filesystem initialization from asynchronous watcher and background tasks.
- **Fixed:** Corrected a misleading log message in the bootstrap process that displayed an incorrect hardcoded Unix socket path.

## 0.6.13 (30. Dec, 2025)

- **Added:** Implemented protocol-aware configuration validation. Vane now enforces strict compatibility checks between plugins and protocols (e.g., HTTP-specific plugins in HTTP flows) at load time, adhering to the "Keep-Last-Known-Good" strategy.
- **Added:** Introduced a background health check task for external plugins (default 15m interval, configurable via `EXTERNAL_PLUGIN_CHECK_INTERVAL_MINS`) to monitor connectivity without impacting traffic processing.
- **Changed:** Refactored the plugin system to introduce `GenericMiddleware` and `HttpMiddleware` traits, establishing a clear boundary between universal cross-layer logic and protocol-specific internal components.
- **Changed:** Enhanced the `Plugin` trait with `supported_protocols` metadata and type-safe downcasting support for the new middleware hierarchy.
- **Changed:** Migrated core internal plugins (`CommonMatch`, `RateLimit`, `ProtocolDetect`, `FetchUpstream`, `CGI`, `Static`) to implement the new tiered middleware traits.
- **Fixed:** Overhauled external middleware drivers (`HTTP`, `Unix`, `Command`) to return a standardized `failure` branch upon network or execution errors, enabling resilient "Try-Catch" flow logic for user-defined pipelines.

## 0.6.12 (30. Dec, 2025)

- **Changed:** Extracted generic hot-reload framework to `src/common/hotswap` and `src/common/loader`, unifying configuration loading and file watching across all modules.

## 0.6.11 (30. Dec, 2025)

- **Changed:** Extracted unified flow execution engine to `src/modules/flow`, eliminating code duplication across L4, L4+, and L7 layers.
- **Changed:** Implemented `ExecutionContext` trait to abstract layer-specific data (KV Store vs Container).

## 0.6.10 (30. Dec, 2025)

- **Added:** Implemented `ProtocolData` trait for protocol extension abstraction. This trait-based system allows different L7 protocols (HTTP, DNS, gRPC) to extend the Container with protocol-specific fields without polluting the core structure, providing a foundation for multi-protocol support.
- **Added:** Introduced `HttpProtocolData` structure to encapsulate HTTP-specific extension fields. WebSocket upgrade handles (`client_upgrade`, `upstream_upgrade`) are now stored in `HttpProtocolData` instead of directly in Container, isolating HTTP-specific logic and enabling future protocol additions.
- **Changed:** Refactored Container structure to include `protocol_data` field. The Container now uses `Option<Box<dyn ProtocolData>>` for protocol-specific extensions, replacing hard-coded HTTP fields and enabling protocol-agnostic Container design.
- **Changed:** Updated HTTP adapters and plugins to access upgrade handles via `Container::http_data_mut()`. The `httpx` adapter, `FetchUpstream` plugin, and `Response` terminator now use the new accessor methods to manipulate HTTP protocol data, maintaining full WebSocket tunneling functionality while improving code organization.

## 0.6.9 (30. Dec, 2025)

- **Added:** Implemented **Unified Template System** across all three layers (L4/L4+/L7). Introduced an AST-based parser with support for string concatenation (`{{conn.ip}}:{{conn.port}}`) and nested template resolution (`{{kv.{{conn.protocol}}_backend}}`), enabling dynamic runtime composition of configuration values.
- **Added:** Implemented **Template Hijacking Mechanism** for L7 layer. Introduced a `Hijacker` trait with protocol-specific implementations (HTTP initially), allowing templates to trigger lazy buffering when accessing special keywords (`req.body`, `req.header.*`, `res.body`). The hijacking logic is organized in a separate `hijack/` directory by layer and protocol.
- **Changed:** Unified template resolution logic into `src/modules/template/`. Eliminated approximately 60 lines of duplicated code between L4 Transport and L4+ Carrier layers by replacing inline `resolve_inputs` functions with a shared implementation using the `TemplateContext` trait.
- **Changed:** Refactored template error handling to use graceful degradation. Missing keys now return the original template string (`{{key}}`) with a warning log instead of failing execution, ensuring robustness in production environments.

## 0.6.8 (29. Dec, 2025)

- **Added:** Implemented **WebSocket Tunneling** support within the Upstream Driver. The `internal.driver.upstream` plugin can now handle HTTP/1.1 Upgrade requests (`101 Switching Protocols`), establishing a bidirectional `tokio::io::copy_bidirectional` tunnel between the client and the backend. This feature is opt-in via the `websocket: true` parameter.
- **Added:** Enhanced the **L7 Container** to carry protocol upgrade handles. Introduced `client_upgrade` and `upstream_upgrade` slots (`OnUpgrade` futures), allowing middleware to capture and defer the raw socket handover until the response phase.
- **Changed:** Upgraded the **HTTPX Protocol Adapter** (`httpx.rs`) to utilize `serve_connection_with_upgrades`. This replaces standard connection handling with `hyper-util`'s upgrade-aware API, resolving previous `!Sync` trait object issues and ensuring correct `101` handshake processing at the transport level.
- **Changed:** Refactored the **Response Terminator** (`internal.terminator.response`) to act as the WebSocket Bridge. It now detects pending upgrade handles in the container, spawns the background tunnel task, and immediately flushes the `101` response to the client, completing the handshake lifecycle.
- **Fixed:** Enforced strict **WebSocket Policy Control**. The upstream driver now validates the `websocket` configuration flag; if a client requests an upgrade but the feature is disabled, Vane intercepts the request and returns a `405 Method Not Allowed`, preventing unauthorized protocol transitions.

## 0.6.7 (25. Dec, 2025)

- **Added:** Implemented the **Static Resource Driver** (`internal.driver.static`). This L7 middleware transforms Vane into a secure, high-performance static file server. It supports path sanitization (traversal protection), MIME type sniffing (`mime_guess`/`infer`), ETag generation, and conditional requests (`If-Modified-Since`), allowing Vane to directly serve web assets without external dependencies.
- **Added:** Integrated **HTTP Range Request** support (`range.rs`) within the static driver. The system can now parse `Range: bytes=x-y` headers and serve `206 Partial Content` using efficient file seeking and bounded streams (`ReaderStream::new(file.take(len))`), enabling media streaming and resumable downloads.
- **Added:** Implemented **SPA (Single Page Application) Mode**. The static driver can be configured with `spa: true` to automatically fallback 404s to `index.html`, supporting modern frontend routing architectures.
- **Added:** Added **Precompression Support**. When `precompress: true` is set, the driver automatically detects and serves `.gz` sidecar files if the client sends `Accept-Encoding: gzip`, reducing bandwidth usage without on-the-fly compression overhead.
- **Added:** Implemented **Directory Browsing**. When enabled via `browse: true`, the driver generates a lightweight HTML index for directories that lack an `index.html` file, useful for file repositories.
- **Changed:** Enhanced the **CGI Driver** (`cgi/plugin.rs`) with intelligent **PATH_INFO**. If `path_info` is not explicitly provided, the plugin now attempts to derive it by stripping the `script_name` prefix from the `request_uri`, ensuring compatibility with frameworks (like OpenWrt LuCI) that rely on correct path splitting.

## 0.6.6 (25. Dec, 2025)

- **Added:** Implemented **Recursive Template Resolution** (`template.rs`) for the L7 Flow Engine. The system now performs deep traversal of nested JSON Objects and Arrays within plugin inputs, allowing dynamic variable substitution (e.g., `{{req.header.x-id}}`) to function correctly inside structured configurations like header maps or body definitions.
- **Added:** Expanded the Plugin Type System (`model.rs`) with `Map`, `Array`, and `Any` parameter types. This enables plugins to officially declare and validate complex input structures, moving beyond simple scalar key-value pairs.
- **Changed:** Upgraded the **Response Terminator** (`internal.terminator.response`) with a "Takeover vs. Inherit" architecture.
  - **Headers:** Now accepts a structured `headers` map. If present, it clears any upstream headers and applies the user-defined set to takeover final headers. If absent, upstream headers are preserved.
  - **Body:** Now accepts a polymorphic `body` field. Users can provide a simple string or a structured object `{ content: "...", encoding: "base64/hex/text" }`. If present, it replaces the upstream body stream with the decoded static buffer. If absent, the upstream stream is preserved.
- **Changed:** Refactored the File Watcher (`requirements.rs`) to intelligently filter filesystem events. It now explicitly ignores `Access` (read) and `Other` (metadata) events, preventing spurious configuration reloads caused by non-destructive file operations.

## 0.6.5 (25. Dec, 2025)

- **Added:** Implemented the **Common Gateway Interface (CGI) Driver** (`internal.driver.cgi`). This privileged L7 middleware enables Vane to execute external applications (e.g., `lua-cgi`, `php-cgi`, C binaries) per request, adhering to RFC 3875 standards. It features a streaming stdout parser that separates headers from the body on-the-fly and pipes the payload directly to the client using the new `VaneBody::Generic` wrapper.
- **Added:** Extended the `VaneBody` enum (`wrapper.rs`) with a `Generic` variant. This architectural primitive allows the L7 Container to transport arbitrary, type-erased `BoxBody<Bytes, Error>` streams (such as those originating from child process pipes) through the middleware pipeline, enabling non-HTTP sources to act as response providers.
- **Changed:** Enhanced the **L7 Protocol Adapters** (`httpx.rs`, `h3.rs`) to automatically extract and inject the URI Query String into the KVStore as `req.query`. This ensures that downstream drivers have access to raw query parameters, distinct from the normalized request path.
- **Changed:** Upgraded the **Fetch Upstream Driver** (`upstream/mod.rs`) to support intelligent **Query String Propagation**. The plugin now accepts an explicit `query` input parameter or automatically falls back to the original `req.query` when operating in transparent proxy mode (where `path` is unspecified), preventing data loss during URL reconstruction.

## 0.6.4 (24. Dec, 2025)

- **Added:** Operators can now tune `UPSTREAM_H2_STREAM_WINDOW` and `UPSTREAM_H2_CONN_WINDOW (default 2MB) via environment variables, enabling optimization of throughput and window management for high-bandwidth upstream links.

## 0.6.3 (24. Dec, 2025)

- **Changed:** Architected a **Full-Duplex H3 Upstream Driver** (`quinn_client.rs`) by decoupling the Request and Response data paths into independent asynchronous tasks using `stream.split()`. This eliminates head-of-line blocking and deadlocks during large payload transfers (e.g., 1GB bidirectional streams), ensuring high-throughput streaming performance.
- **Changed:** Refined the **L7 HTTP/3 Server Engine** (`h3.rs`) to utilize a concurrent `tokio::select!` loop that manages Request Body pumping and Response Body streaming simultaneously. This ensures the upstream response is fully flushed to the client even if the request body upload is still in progress or finishing.

## 0.6.2 (23. Dec, 2025)

- **Changed:** Hardened the **QUIC Muxer Lifecycle** (`muxer.rs`) by transitioning `MUXER_REGISTRY` from Weak to Strong (`Arc`) references with an activity-based Garbage Collector. This prevents `QuicEndpoint` flapping during high-frequency packet ingress, ensuring cryptographic context persistence and eliminating "authentication failed" handshake errors.
- **Changed:** Updated the **L4+ Carrier Logic** (`tls.rs`, `quic.rs`) to actively process `TerminatorResult::Upgrade`. This completes the architectural link between the Transport Layer and the Application Layer, enabling seamless handover from raw TCP/UDP flows to the `httpx` and `h3` engines.
- **Fixed:** Resolved a critical **Runtime Panic** in the Upstream Connection Pool (`pool.rs`). Explicitly injected `TokioTimer` into the `hyper_util` Client builder to satisfy requirements for connection pooling and keep-alive features which were previously crashing the worker threads.

## 0.6.1 (23. Dec, 2025)

- **Added:** Introduced a **Feature-Gated TLS Crypto Backend Selection** mechanism. Vane now defaults to **aws-lc-rs** as the global `rustls` CryptoProvider, while allowing users to explicitly switch to **ring** at compile time by disabling default features. This enables controlled experimentation and comparison of crypto backends without altering application code.
- **Changed:** Clarified the architectural boundary between **TLS/QUIC cryptography** and **internal cryptographic utilities**. The `ring` crate may now coexist as an internal dependency without interfering with the global TLS provider, preserving modularity and future extensibility.
- **Fixed:** Eliminated potential provider ambiguity errors in multi-crate builds by enforcing a strict one-provider policy aligned with `rustls` 0.23 requirements.

## 0.6.0 (23. Dec, 2025)

- **Added:** Implemented the **Stateful L4+ Session Layer** (`session.rs`) to resolve the architectural conflict between SNI-based routing and encrypted QUIC packets. The system now maintains a **Global State** using `CID_REGISTRY` for exact Destination Connection ID matching and `IP_STICKY_MAP` for fuzzy IP:Port matching, allowing Vane to cache Flow Engine decisions and support complex handshake lifecycles (controlled by `QUIC_STICKY_SESSION_TTL`).
- **Added:** Integrated **QUIC Stream Reassembly** logic within the protocol parsers. Vane now utilizes a `PendingState` buffer to temporarily hold Raw UDP Packets and Decrypted CRYPTO Frames. This allows the engine to reconstruct TLS ClientHellos split across multiple datagrams (e.g., by `quic-go` clients), ensuring reliable SNI extraction before releasing the buffered sequence to the upstream.
- **Changed:** Overhauled the **UDP Ingress Architecture** (`tasks.rs`) to implement a **Fast Path / Slow Path** model. Incoming packets now undergo a "Speculative Check" for Long/Short Header DCIDs; session hits are **Directly Forwarded** (bypassing the Flow Engine entirely), while only unknown Initial packets fall through to the Slow Path for L4 decision-making.
- **Changed:** Refactored the monolithic parsing logic into a modular **Protocol Parsing Suite**. Split `parser.rs` into `packet.rs` (Wire Format), `crypto.rs` (Decryption), and `frame.rs` (Frame Parsing). This decoupling facilitates the distinct handling of unencrypted header inspection and encrypted payload buffering required for the new stateful design.
- **Fixed:** Resolved **Transparent Proxy Instability** (`proxy.rs`) involving NAT consistency and packet loss. Implemented **Lossless Queue Flushing** to drain buffered fragments from `PendingState` to the target immediately after a forwarding decision. Additionally, fixed `os error 22` by ensuring `SessionAction::Forward` utilizes dedicated ephemeral upstream sockets rather than the shared listener socket, maintaining stable Source Ports for NAT traversal.
- **Fixed:** Addressed **QUIC Connection Migration** and Server Hello CID changes. The Fast Path now implements an **IP Stickiness Fallback**; when direct CID matching fails (e.g., during Server Hello generation), Vane falls back to `IP_STICKY_MAP` to blindly forward packets associated with an active session, preserving connectivity without needing full decryption.

## 0.5.8 (18. Dec, 2025)

- **Added:** Implemented the **HTTP/3 Upstream Engine** (`quinn_client.rs`) backed by a **Global QUIC Connection Pool** (`quic_pool.rs`). The system now supports high-performance, multiplexed HTTP/3 tunneling with connection reuse, automatic ALPN negotiation, and concurrent body streaming, completing the "Dual-Engine" promise.
- **Added:** Integrated **Unified Network Infrastructure** for Upstream Drivers. Both Hyper (H1/H2) and Quinn (H3) clients now bridge to Vane's internal **Async DNS Resolver** (`hickory-resolver`), honoring custom `NAMESERVER` environment variables. Additionally, integrated `rustls-native-certs` to load system root certificates, enabling trusted HTTPS connections for both TCP and UDP transports.
- **Changed:** Refactored the **L7 Container Architecture** to implement **Native Header Passthrough**. Replaced the legacy KV-based header storage with zero-copy `http::HeaderMap` slots (`request_headers` / `response_headers`). This guarantees correct handling of multi-value headers (e.g., `Set-Cookie`) and case-sensitivity while eliminating serialization overhead during standard forwarding.
- **Changed:** Upgraded the **L7 Flow Engine** (`flow.rs`) with **Template Hijacking**. The engine now prioritizes "Magic Words" (`{{req.header.*}}`, `{{req.body}}`) via an **On-Demand Access** strategy. It directly queries the Container's native storage or triggers lazy buffering only when requested, treating the KV store as a fallback rather than the primary data source.
- **Changed:** Optimized the **Hyper TCP Engine** (`hyper_client.rs`). Removed redundant Response-Header-to-KV synchronization loops (relying on the new Smart Hijacking instead) and implemented automatic **Host Header Rewriting** to prevent upstream 404 errors caused by mismatching SNI/Host values.

## 0.5.7 (17. Dec, 2025)

- **Added:** Introduced the **L7 Terminator Interface** (`L7Terminator`) within the plugin system. This privileged trait allows termination logic to directly access the `Container` and its response signaling channel, enabling decoupled communication between the Flow Engine and Protocol Adapters.
- **Added:** Implemented the **Send Response Terminator** (`src/modules/plugins/terminator/response/`). This core plugin finalizes the L7 lifecycle by constructing HTTP responses from KV metadata (`res.status`, `res.header.*`) or static configuration, and signaling the waiting Adapter to flush data to the client.
- **Added:** Integrated **Content-Type Sniffing**. The response terminator now automatically detects MIME types (JSON, HTML, Text) for static or buffered bodies using magic byte analysis (`infer`) and structural validation, ensuring correct `Content-Type` headers when explicit configuration is absent.
- **Changed:** Updated the **L7 Flow Engine** (`flow.rs`) to prioritize `L7Terminator` execution. The engine now correctly casts and passes the `Container` (as `Any + Send`) to the terminator, completing the "Actor Model" loop for request-response processing.

## 0.5.6 (17. Dec, 2025)

- **Added:** Implemented **Smart URL Normalization**. The upstream driver now automatically handles slash sanitization (trimming trailing slashes from the prefix and leading slashes from the path), ensuring valid URL construction (e.g., `http://api/` + `/v1` -> `http://api/v1`) regardless of input formatting.
- **Added:** Integrated **Automatic Path Forwarding**. If the `path` parameter is omitted in the configuration, the driver defaults to the original request path (`req.path`), streamlining setup for transparent reverse proxy scenarios.
- **Changed:** Refined the **Fetch Upstream Driver** (`src/modules/plugins/upstream/`). Replaced the single `url` parameter with a flexible `url_prefix` and `path` composition model, enabling dynamic backend routing while maintaining strict base URL control.

## 0.5.5 (17. Dec, 2025)

- **Added:** Implemented the **Fetch Upstream Driver** (`src/modules/plugins/upstream/`). This core L7 middleware enables Vane to act as a reverse proxy by forwarding requests to backend servers. It features a **Dual-Engine Architecture**, shipping with a production-ready TCP Engine (Hyper-based) and a reserved interface for the future UDP/QUIC Engine.
- **Added:** Integrated a **Global Connection Pool** (`pool.rs`) for the TCP Engine. Utilizes `hyper-util` and `hyper-rustls` to maintain persistent Keep-Alive connections, supporting automatic ALPN negotiation (H1/H2) and configurable SSL verification policies (secure by default, with an optional `skip_verify` flag).
- **Added:** Implemented **Zero-Copy Request Forwarding**. The upstream driver leverages the `VaneBody` architecture to "steal" the payload from the Container's Request slot and pipe it directly to the upstream socket, utilizing Rust's ownership model to ensure memory efficiency.
- **Changed:** Updated the **Plugin Registry** to include `internal.driver.upstream`. This plugin is now available for use in Application flow configurations with parameters for `url`, `method`, `version`, and `skip_verify`.

## 0.5.4 (17. Dec, 2025)

- **Added:** Introduced the **Privileged L7 Middleware Interface** (`L7Middleware`) in the plugin system. This trait utilizes `&mut dyn Any` context injection to break circular dependencies between the plugin model and the stack, granting specialized plugins direct mutable access to the L7 `Container` (Body & KV) for advanced operations like WAFs or Upstream Drivers.
- **Changed:** Refactored the L7 `Container` to use a **Dual-Slot Payload Architecture**. Replaced the single `payload` field with distinct `request_body` and `response_body` slots, resolving state ambiguity during full-duplex streaming and ensuring clear separation between client input and upstream output.
- **Changed:** Updated the **L7 Flow Engine** (`flow.rs`) to support the new payload structure. "Magic Words" are now strictly routed: `{{req.body}}` forces buffering on the Request slot, while `{{res.body}}` targets the Response slot.
- **Changed:** Adapted **H3** and **HTTPX** adapters to the new container signature. Both engines now correctly populate the `request_body` upon initialization and, in the case of HTTPX, extract the final payload from `response_body` for transmission to the client.

## 0.5.3 (17. Dec, 2025)

- **Added:** Implemented the **Unified L7 Body Wrapper** (`src/modules/stack/protocol/application/http/wrapper.rs`). Introduced `VaneBody` and `H3BodyAdapter` to bridge the impedance mismatch between Hyper (`Incoming`) and Quinn (`Bytes`), enabling a polymorphic, zero-copy payload transport across HTTP/1.1, HTTP/2, and HTTP/3.
- **Added:** Architected the **H3 Driver Actor Model** (`src/modules/stack/protocol/application/http/h3.rs`). The H3 engine now spawns a dedicated driver task that decouples the bidirectional `RequestStream` ownership. It pumps request body chunks into a channel for the Container and waits for asynchronous response signals from the Terminator, effectively solving critical lifetime and borrow checker conflicts in the async runtime.
- **Changed:** Refactored the **L7 Container** (`container.rs`) to support **Response Signaling**. The container now carries an ephemeral `oneshot::Sender`, allowing the Flow Engine's Terminator to inject response metadata (Status/Headers) back into the protocol adapter without requiring direct access to the underlying physical socket.
- **Changed:** Upgraded the **HTTPX Adapter** (`httpx.rs`) to the new Response Channel architecture. The adapter now suspends execution until a signal is received from the Terminator, allowing fully dynamic status codes (e.g., 201, 204, 404) and payload transformations via the middleware pipeline, replacing the previous hardcoded success response logic.

## 0.5.2 (16. Dec, 2025)

- **Added:** Implemented **Zero-Copy Virtual UDP Socket** (`src/modules/stack/protocol/carrier/quic/virtual_socket.rs`). This high-performance IO adapter implements `quinn::AsyncUdpSocket`, allowing Vane to inject raw UDP packets directly from the L4 Dispatcher into the QUIC engine's memory space, bypassing additional kernel socket overhead and enabling true port sharing between stateless UDP and stateful QUIC flows.
- **Added:** Introduced the **QUIC Muxer Manager** (`src/modules/stack/protocol/carrier/quic/muxer.rs`). This subsystem manages the lifecycle of internal Quinn Endpoints, bridging stateless L4 UDP datagrams to stateful L7 QUIC connections via high-speed asynchronous channels (`mpsc`).
- **Added:** Integrated the **L7 HTTP/3 Engine** (`src/modules/stack/protocol/application/h3.rs`). Vane can now perform full QUIC termination and HTTP/3 processing, utilizing `h3` and `h3-quinn` to map QUIC bidirectional streams into the universal L7 Container for middleware pipeline execution.
- **Changed:** Refined the **QUIC Carrier** (`quic.rs`) to utilize the new Muxer architecture. When an `h3` upgrade signal is detected, the carrier now seamlessly feeds the Initial packet into the Virtual Socket to establish the L7 session context.
- **Fixed:** Resolved a critical lifetime variance issue in the **TCP Dispatcher** (`dispatcher.rs`). The protocol identifier string is now properly owned/cloned before being moved into asynchronous carrier tasks, preventing "borrowed value does not live long enough" compilation errors during plaintext protocol upgrades.
- **Fixed:** Enforced exhaustive pattern matching for `ConnectionObject::Virtual` across all Terminator plugins (`proxy`, `abort`, `upgrade`). This ensures internal L7 virtual streams are handled gracefully rather than causing compilation failures.

## 0.5.1 (16. Dec, 2025)

- **Added:** Implemented the **Plaintext L4+ Carrier** (`src/modules/stack/protocol/carrier/plain.rs`). This engine manages unencrypted TCP flows that have been identified as HTTP (or other plaintext protocols), bridging the gap between raw L4 TCP and the L7 Application layer.
- **Added:** Integrated **Zero-Copy HTTP Header Peeking** for L4+ routing. The Plaintext Carrier now uses `httparse` to inspect the initial TCP buffer, extracting `http.host`, `http.method`, and `http.path` into the KV Store for routing decisions without consuming the socket or requiring full termination.
- **Changed:** Expanded the **TCP Dispatcher** to support plaintext protocol upgrades. The dispatcher now correctly routes `http` signals from the L4 Flow Engine to the new Plaintext Carrier, enabling a complete "TCP -> L4+ HTTP -> L7 HTTPX" execution path.

## 0.5.0 (16. Dec, 2025)

- **Breaking:** Refactored the `Terminator` trait signature. The `execute` method now accepts a mutable `&mut KvStore` instead of an immutable reference, enabling plugins to write back to the context during termination logic. All custom terminator plugins must be updated.
- **Breaking:** Expanded the `ConnectionObject` enum with a `Virtual(String)` variant. This represents internal L7 states or abstract contexts where a physical socket has been consumed by an adapter (e.g., Hyper). Match arms on `ConnectionObject` in existing code must now handle this variant.
- **Added:** Implemented the **L7 Container Architecture**. Introduced a protocol-agnostic "Envelope" (`src/modules/stack/protocol/application/container.rs`) that holds metadata (KV) and a polymorphic `PayloadState`. This supports **Lazy Buffering**, allowing streams to remain 0-copy by default but automatically buffering into memory when "Magic Words" (e.g., `{{req.body}}`) are detected in plugin templates.
- **Added:** Integrated the **L7 HTTPX Adapter**. Added `application/httpx.rs` powered by `hyper` (v1), enabling Vane to act as a high-performance HTTP/1.1 and HTTP/2 server. The adapter maps incoming requests to the L7 Container and executes the configured flow pipeline.
- **Added:** Implemented the **TLS Decryptor Bridge**. Created `decryptor.rs` to handle the physical transition from L4+ (TLS Stream) to L7 (Cleartext). It performs server-side TLS termination, ALPN negotiation, and seamless handover to the L7 engine.
- **Added:** Enhanced the Certificate Loader with **Auto-Generation**. Vane now automatically checks for a `default.crt/key` pair on startup. If missing or expiring within 7 days, a self-signed certificate (localhost/127.0.0.1) is automatically generated using `rcgen`, ensuring zero-config SSL readiness.
- **Changed:** Upgraded the `internal.transport.upgrade` plugin to support a specific `cert` parameter. This allows flows to override the automatic SNI-based certificate lookup with a specific certificate ID during the L4+ to L7 transition.
- **Changed:** Refactored internal Certificate Registry storage. The registry now holds `Arc<LoadedCert>` containing raw `PrivateKeyDer` bytes instead of pre-built `CertifiedKey` objects, resolving `rustls` 0.23 cloning limitations during custom TLS acceptor construction.

## 0.4.9 (15. Dec, 2025)

- **Added:** Implemented the **L7 Application Layer Infrastructure**. Introduced the `application` configuration subsystem (`src/modules/stack/protocol/application/`), enabling Vane to manage high-level application protocols (e.g., `httpx`) independently of the underlying transport carrier.
- **Added:** Established the **Application Registry & Hotswap Engine**. The system now actively monitors the `config/application/` directory, supporting dynamic loading and "Keep-Last-Known-Good" updates for L7 protocol pipelines using JSON, YAML, or TOML formats.
- **Added:** Integrated L7 config channels into the Core Bootstrap sequence. The `requirements` module now provisions the `application` directory and spawns dedicated file watchers, ensuring application-layer logic is initialized alongside L4 listeners and L4+ resolvers.
- **Changed:** Updated the global `ConfigChangeReceivers` struct to include the new `applications` channel, extending the event-driven architecture to support three distinct configuration layers (Ports -> Resolvers -> Applications).

## 0.4.8 (14. Dec, 2025)

- **Added:** Implemented a dedicated **Certificate Management Module** (`src/modules/certs`). This system provides hot-swappable, in-memory storage for TLS certificates (`Arc<CertifiedKey>`) using `rustls-pemfile` and `ring` crypto providers.
- **Added:** Enforced a **Strict Validation Policy** for certificate loading. The loader automatically resolves file conflicts (discarding ambiguous pairs like `app.crt` + `app.pem`) and mandates the presence of a matching `.key` file before admitting credentials into the registry.
- **Changed:** Integrated the **Keep-Last-Known-Good** strategy for certificate updates. Runtime modification of certificate files now triggers a safe reload process that rejects invalid or malformed keys, preventing service interruptions by preserving the previously valid state.
- **Changed:** Optimized the **Bootstrap Sequence**. Certificate initialization has been moved ahead of L4 Listener binding, ensuring that all cryptographic materials are pre-loaded and ready for immediate SSL handshakes upon socket activation.
- **Changed:** Refactored core error handling to use `thiserror`. This improves diagnostic clarity within the configuration and loader subsystems by providing structured, chainable error contexts.

## 0.4.7 (14. Dec, 2025)

- **Added:** Implemented the **L4+ QUIC Carrier Engine**. Vane can now accept raw UDP datagrams, detect QUIC traffic, and "upgrade" the flow to the QUIC layer. This includes an RFC 9000 compliant parser that extracts Initial Packet headers (DCID, SCID, Version, Token) and populates the KV Store (e.g., `quic.dcid`, `quic.version`) for routing decisions.
- **Added:** Introduced **QUIC Association Proxying** ("Sticky NAT") within the `internal.transport.proxy` plugin. This enables the stateless Flow Engine to maintain ephemeral UDP sessions for QUIC flows, ensuring correct bi-directional packet routing (Client ↔ Upstream) after a dispatch decision is made.
- **Changed:** Refined `internal.transport.upgrade` to enforce strict transport-layer compatibility. The plugin now rejects invalid state transitions (e.g., attempting to upgrade a TCP stream to QUIC) while permitting valid upgrades (TCP → TLS/HTTP, UDP → QUIC).
- **Fixed:** Critical regression in **Load Balancer Failover**. Restored the missing `health::mark_target_unhealthy` calls within the TCP and Generic proxy logic. Connection timeouts and refusals now correctly downgrade target health, allowing the Balancer's Auto Recovery and Serial strategies to function as intended.
- **Fixed:** Resolved a logic conflict in the UDP Dispatcher (`udp.rs`). The execution path is now strictly separated into **Legacy Mode** (high-performance Sticky Sessions for backward compatibility) and **Flow Mode** (Per-packet context processing and Upgrade support), ensuring new features do not break existing configurations.

## 0.4.6 (13. Dec, 2025)

- **Changed:** Implemented **Flow Path Inheritance** for protocol upgrades. The L4 Flow Engine now calculates and passes the exact execution path (e.g., `...internal_transport_upgrade.tls`) to the L4+ engine via the `TerminatorResult`. This ensures KV namespace isolation remains consistent and collision-free across protocol layer transitions.
- **Changed:** Enhanced the `internal.common.match` middleware to support verbose operator aliases (`equal`, `not_equal`, `starts_with`, `ends_with`, `contain`) and added debug logging for runtime value comparisons.
- **Changed:** Upgraded error propagation across the Dispatcher, Proxy, and Flow engines. System logs now use the alternate formatting `{:#}` to display the full error chain (Context + Root Cause), exposing underlying I/O errors (e.g., "Connection reset by peer") previously masked by generic wrapper messages.
- **Fixed:** Replaced the manual `ClientHello` byte parser with the robust `tls-parser` crate. This resolves compilation type mismatches and ensures accurate extraction of complex TLS extensions (SNI, ALPN, Key Shares) regardless of field ordering or padding.

## 0.4.5 (13. Dec, 2025)

- **Added:** Introduced `internal.common.match`, a universal logic middleware. This plugin performs boolean comparisons between dynamic KVStore variables and static values, enabling flexible routing logic across all protocol layers. Supported operators now include verbose aliases:
  - Equality: `==`, `eq`, `equal`, `equals`
  - Inequality: `!=`, `ne`, `notequal`, `not_equal`
  - String ops: `contains`, `startswith`, `endswith`
- **Added:** Implemented comprehensive **TLS ClientHello Fingerprinting**. The system now parses and extracts the following metadata from the raw handshake:
  - **Basics:** SNI (Server Name Indication), ALPN (Application-Layer Protocol Negotiation), Legacy Protocol Version, Session ID, Random Bytes.
  - **Cryptographic Params:** Cipher Suites, Compression Methods, Supported Groups (Elliptic Curves), Signature Algorithms.
  - **Extensions:** Supported Versions (TLS 1.3), Key Share Groups, PSK Key Exchange Modes, Renegotiation Info.
  - **Security:** GREASE value detection (RFC 8701).
- **Changed:** Expanded the L4+ Context Injector (`context.rs`) to automatically populate the KVStore with the full spectrum of extracted TLS data (e.g., `tls.cipher_suites`, `tls.supported_groups`) immediately upon handshake detection.
- **Changed:** Removed the specialized `internal.protocol.tls.sni` and `internal.protocol.tls.alpn` plugins. These specific routing functions are now superseded by the combination of automatic Context Injection and the generic `internal.common.match` plugin.

## 0.4.4 (13. Dec, 2025)

- **Added:** Implemented advanced L4+ TLS routing capabilities with two new middleware plugins: `internal.protocol.tls.sni` and `internal.protocol.tls.alpn`. These plugins enable granular traffic filtering and branching based on Server Name Indication and Application-Layer Protocol Negotiation extensions without requiring TLS termination.
- **Added:** Enhanced the L4+ TLS Carrier to automatically peek and capture the raw `ClientHello` handshake message immediately after connection upgrade. The payload is hex-encoded and injected into the KVStore as `tls.clienthello`, serving as the foundational data source for upstream routing logic.
- **Added:** Introduced the `TLS_CLIENTHELLO_BUFFER_SIZE` environment variable (default: `4096` bytes). This allows operators to configure the initial socket peek window size, ensuring compatibility with clients sending unusually large handshake messages.
- **Changed:** Optimized the TLS Carrier entry point signature in `src/modules/stack/protocol/carrier/tls.rs`, removing unnecessary mutable bindings for the `TcpStream` handle during the context injection phase.

## 0.4.3 (13. Dec, 2025)

- **Breaking:** Refactored `TerminatorResult::Upgrade` to carry the active `ConnectionObject`. This architectural shift requires plugins to yield ownership of the underlying connection upon upgrade, ensuring the socket remains alive during L4-to-L4+ transitions.
- **Added:** Implemented L4+ Context Injection via the new `carrier/context.rs` module. This standardizes the population of protocol-specific metadata (e.g., `tls.sni`, `conn.layer`) into the KVStore immediately after a connection upgrade.
- **Changed:** Upgraded the Core Dispatcher (`dispatcher.rs`) to handle physical socket handover. It now captures the `ConnectionObject` returned by an Upgrade signal and spawns the specific Carrier logic (e.g., TLS runtime), completing the "Protocol Elevator" implementation.
- **Changed:** Updated the Flow Engine (`flow.rs`) and the `internal.transport.upgrade` plugin to support the new return signature, ensuring proper ownership transfer of `TcpStream` and `ByteStream` objects throughout the execution tree.

## 0.4.2 (11. Dec, 2025)

- **Breaking:** Refactored the internal plugin module structure. Moved `abort_connection.rs` to `abort.rs` and reorganized all transport proxy plugins into a modular `src/modules/plugins/terminator/transport/proxy/` directory to support complex multiprotocol implementations.
- **Added:** Introduced the `ByteStream` trait abstraction and the `ConnectionObject::Stream` variant. This enables the Flow Engine to pass generic, encrypted, or virtual streams (L4+) through the same pipeline as raw TCP/UDP sockets (L4).
- **Changed:** Upgraded the `internal.transport.proxy` plugin family (IP, Node, Domain) to support **Polymorphic Dispatching**. These plugins now automatically detect the underlying connection type (`TcpStream` vs `ByteStream`) and select the appropriate forwarding strategy, enabling seamless proxying for both raw L4 and upgraded L4+ protocols.
- **Changed:** Enhanced the Resolver configuration loader (`hotswap.rs`) with a **Keep-Last-Known-Good** fallback strategy. If a runtime configuration update contains conflicts or validation errors, the system now preserves the previous valid state instead of disabling the protocol, ensuring higher availability during config rollouts.

## 0.4.1 (11. Dec, 2025)

- **Added:** Implemented the L4+ Resolver Infrastructure. The system now actively scans and manages `config/resolver/{protocol}.{yaml|yml|json|toml}` configurations, allowing high-level protocol flows (e.g., TLS, HTTP) to be defined independently of physical L4 listeners.
- **Added:** Enforced a "Zero Tolerance" configuration policy for Resolvers. The loader now strictly prohibits parallel configuration files for the same protocol (e.g., simultaneous `tls.yaml` and `tls.json`). If conflicts are detected, the specific protocol is explicitly disabled to prevent undefined runtime behavior.
- **Changed:** Generalized the core configuration loader (`src/modules/stack/transport/loader.rs`). Extracted file reading, parsing, and validation into a reusable public `load_file` API, decoupling the loading logic from port-specific implementations.
- **Changed:** Integrated L4+ Resolvers into the system lifecycle. The bootstrap sequence and file watchers (`requirements.rs`) now initialize resolver states and monitor the `resolver/` directory for real-time updates, synchronizing changes via `ArcSwap`.
- **Changed:** Restructured the internal plugin hierarchy by moving the `upgrade` terminator to a dedicated `src/modules/plugins/terminator/upgrader/` directory, architecturaly separating layer-transition logic from standard transport terminators.

## 0.4.0 (10. Dec, 2025)

- **Breaking:** Redesigned the core `Terminator` plugin trait architecture (Terminator 2.0). The `execute` method signature has changed to return a `TerminatorResult` enum (supporting `Finished` or `Upgrade`) instead of a simple `Result`, enabling plugins to dictate complex flow control actions beyond simple termination.
- **Added:** Introduced the `internal.transport.upgrade` plugin. This critical component acts as an architectural bridge, allowing L4 connections to preserve their underlying socket state while transitioning control to higher-level L4+ (TLS) or L7 (HTTP) resolvers.
- **Added:** Implemented strict **Layer Awareness** in the plugin system. Terminators must now explicitly declare their supported architectural layers (`L4`, `L4Plus`, `L7`), and the configuration validator strictly enforces these constraints to prevent invalid cross-layer plugin usage.
- **Added:** Automatic injection of the `{{conn.layer}}` system variable (initializing as `"l4"` at the listener entry point), allowing flow logic and plugins to dynamically adapt behavior based on the current protocol depth.
- **Changed:** Upgraded the Flow Engine's recursive executor (`src/modules/stack/transport/flow.rs`) to support **Signal Bubbling**. The engine now captures and propagates termination signals from deep within the flow tree back to the central Dispatcher, enabling stateful protocol transitions.

## 0.3.7 (10. Dec, 2025)

- **Added:** Introduced two new core plugins for the Flow Engine: `internal.transport.proxy.node` and `internal.transport.proxy.domain`. These plugins enable direct L4 traffic termination to named Nodes (from `nodes.yaml`) or dynamic Domains (via DNS), streamlining complex routing configurations without requiring external scripts.
- **Changed:** Refactored the internal proxy architecture by extracting the core execution logic into a shared `proxy` module. This unifies the implementation of all transport terminators (IP, Node, Domain), reducing code duplication and ensuring consistent behavior across different target types.
- **Changed:** Deprecated the `internal.transport.proxy.transparent` plugin name in favor of the more concise `internal.transport.proxy`. The legacy name remains supported as an alias to maintain backward compatibility with existing flow configurations.
- **Changed:** Enhanced the `resolver` module to expose a public `resolve_domain_to_ips` helper function, allowing internal plugins to leverage the centralized, high-performance async DNS resolver for dynamic target resolution.

## 0.3.6 (9. Dec, 2025)

- **Changed:** Enhanced the `exec` plugin driver to capture `stderr` output from child processes. Plugin logs are now sanitized and piped directly into Vane's structured logging system at the `Debug` level, preventing console pollution while maintaining observability.
- **Fixed:** Resolved an input compatibility issue in the `exec` driver where line-buffered readers (e.g., Bash `read`, Java `Scanner`) failed to detect JSON payloads. The system now automatically appends a newline (`\n`) to the standard input stream, ensuring robust inter-process communication across all programming languages.

## 0.3.5 (8. Dec, 2025)

- **Added:** Implemented strict **KV Namespace Isolation** for the Flow Engine. Plugin outputs are now automatically namespaced using the unique execution path (`plugin.{flow_path}.{name}.{key}`), allowing identical plugins to be nested or reused multiple times within a complex flow tree without variable collision or state corruption.
- **Changed:** Refactored the recursive `Flow` executor (`src/modules/stack/transport/flow.rs`) to propagate a dynamic `flow_path` context string throughout the execution chain, establishing the architectural foundation for scoped state management.
- **Fixed:** Resolved a JSON deserialization mismatch in the External Plugin Registration API. The `ExternalPluginDriver` configuration now strictly enforces **Internal Tagging** (requiring a `"type"` discriminator field), fixing 400 Bad Request errors and aligning the server-side parser with the client-side JSON contract.

## 0.3.4 (4. Dec, 2025)

- **Changed:** Migrated the core DNS resolution dependency from the deprecated `trust-dns-resolver` to `hickory-resolver` (v0.25+). This modernization refactors the resolver initialization logic to utilize the new `TokioResolver::builder_with_config` pattern, aligning with the latest async IO standards.
- **Fixed:** Resolved the critical [**CVE-2024-12224**](https://rustsec.org/advisories/RUSTSEC-2024-0421) vulnerability in the dependency tree. By upgrading to `hickory-resolver`, Vane eliminates the risks associated with the flawed `idna` (v0.4.0) crate, ensuring robust protection against Punycode spoofing and homograph attacks in domain resolution.

## 0.3.3 (4. Dec, 2025)

- **Added:** Fully implemented the `http` and `unix` external plugin drivers. These drivers now function as fully compliant API clients, transmitting plugin inputs via POST requests and parsing responses according to a strict data contract.
- **Added:** Implemented a lightweight, dependency-free HTTP/1.1 client for the `unix` driver, enabling high-performance, low-latency communication with local plugins via Unix Domain Sockets without the overhead of a full HTTP stack.
- **Added:** Introduced the `EXTERNAL_HTTPS_CALL_SKIP_TLS_VERIFY` environment variable, allowing operators to globally disable TLS certificate verification for external HTTP plugins (e.g., when using self-signed certificates in internal networks).
- **Changed:** Enforced a standardized **API Response Contract** for all external plugins. To ensure reliability, external services must now return a unified JSON structure (`{ "status": "success", "data": ... }`), mirroring Vane's internal management API format.

## 0.3.2 (4. Dec, 2025)

- **Breaking:** Redesigned the external plugin execution model. The `bin` driver has been replaced by a more robust `command` driver. Configuration now requires explicit `program`, `args`, and `env` fields, enabling secure, shell-independent execution of binaries and interpreters (e.g., Python, Node.js) in restricted environments (Distroless/Musl).
- **Added:** Implemented the **JSON-over-Stdin** protocol for external command plugins. Vane now streams `ResolvedInputs` as a JSON payload to the child process's standard input and strictly parses standard output as `MiddlewareOutput` JSON, allowing for rich data exchange without command-line argument limits.
- **Added:** Integrated automatic **PATH resolution** for the `command` driver. Vane now intelligently searches the system `PATH` environment variable if the specified `program` is not a direct file path, simulating standard OS behavior.
- **Changed:** Architecturally decoupled the plugin execution logic into a dedicated `drivers` module (`exec`, `httpx`, `unix`), strictly enforcing the Single Responsibility Principle (SRP) and creating a foundation for future driver expansions.
- **Changed:** Updated the entire Plugin ecosystem to utilize `Cow<'static, str>` for parameter names and output branches, finalizing the transition to a zero-overhead, memory-safe string handling model.

## 0.3.1 (3. Dec, 2025)

- **Changed:** **Architectural Refactor:** Refactored the core `ParamDef` structure and `Middleware::output` signature to utilize `Cow<'static, str>` instead of `&'static str`. This creates a unified type system that efficiently handles both zero-cost static strings for built-in plugins and owned, garbage-collected strings for external plugins.
- **Fixed:** Eliminated a memory leak in the `ExternalPlugin` loader. Dynamic parameter names are no longer forced into `'static` lifetime via `Box::leak`, allowing for safe creation and destruction of external plugin definitions without residual memory usage.
- **Fixed:** Updated the recursive flow validator (`validator.rs`) to strictly handle Copy-on-Write string comparisons, ensuring accurate validation logic for mixed static/dynamic plugin environments.

## 0.3.0 (3. Dec, 2025)

- **Added:** Introduced the **External Plugin System**, enabling the integration of custom logic via three distinct drivers: `Http` (Remote Webhook), `Unix` (Local Socket), and `Bin` (Executable/Shell). This allows developers to extend Vane's functionality using any language or local tool.
- **Added:** Implemented a full RESTful management API (`/plugins`) supporting dynamic registration, updates, deletion, and listing of external plugins without requiring a service restart.
- **Added:** Integrated a persistent storage layer (`plugins.json`) which automatically saves and restores registered external plugins across system reboots.
- **Added:** Implemented strict connectivity validation for new plugins. HTTP endpoints are now verified via an `OPTIONS` request during registration to ensure availability. This check can be bypassed for development using the `SKIP_VALIDATE_CONNECTIVITY` environment variable.
- **Changed:** Enforced a critical security boundary: External plugins are now strictly limited to the `Middleware` role. The system explicitly rejects any attempt to register external code as a `Terminator` to protect core connection handling logic.
- **Fixed:** Resolved a potential startup failure where a newly created, empty `plugins.json` file would cause a JSON parsing error. The loader now detects zero-byte files and automatically initializes them with a valid default structure (`{}`).

## 0.2.6 (3. Dec, 2025)

- **Added:** Introduced two new high-performance rate-limiting middleware plugins: `internal.common.ratelimit.sec` and `internal.common.ratelimit.min`. These plugins enable precise traffic control based on arbitrary context keys (e.g., `{{conn.ip}}`), supporting separate counters for per-second and per-minute windows.
- **Added:** Implemented a robust memory management system for the rate limiters, configurable via `MAX_LIMITER_MEMORY` (default: 4MB).
- **Added:** Designed a "self-preservation" eviction strategy for the rate limiter pools. Instead of rejecting traffic when memory limits are reached, the system now randomly prunes approximately 10% of the oldest entries, preventing Out-Of-Memory (OOM) crashes while maximizing service availability under heavy load.
- **Added:** Integrated asynchronous background cleanup tasks that automatically reset rate-limit counters at 1-second and 60-second intervals, ensuring accurate window enforcement with zero impact on request latency.

## 0.2.5 (3. Dec, 2025)

- **Changed:** Enhanced the configuration diffing logic to perform a deep equality check (`PartialEq`) on loaded `TcpConfig` and `UdpConfig` objects.
- **Changed:** Implemented a new `RELOAD` lifecycle action. When a configuration change is detected for an active port, the listener is now automatically stopped and immediately restarted to apply the new settings, clearly logged as `↻ ... RELOAD (Config Changed)`.
- **Fixed:** Resolved a critical issue in the configuration hot-swap mechanism (`src/modules/ports/hotswap.rs`) where changes to the _content_ of an existing listener's file (e.g., updating flow rules, targets, or logic) were ignored if the listener remained active. The system previously only tracked the presence of a configuration, failing to trigger updates for in-place modifications.

## 0.2.4 (2. Dec, 2025)

- **Added:** Significantly enhanced the `internal.protocol.detect` middleware with robust, multi-dimensional heuristic checks for **DNS** (validating QR bit, Opcode, and QDCOUNT) and **QUIC** (validating Fixed Bit and Version per RFC 9000), ensuring zero-collision protocol identification.
- **Changed:** Refined the UDP Flow Engine execution model to enforce strict **per-packet decision making**. Unlike the legacy sticky session mode, the Flow Engine now evaluates the plugin tree for every single datagram, using internal NAT mappings solely for routing return traffic from upstream backends.
- **Fixed:** Resolved a critical false-positive detection issue where DNS packets with specific random Transaction IDs (starting with `0xC0`) were misidentified as QUIC traffic due to overlapping header signatures.

## 0.2.3 (2. Dec, 2025)

- **Added:** Extended the Flow Engine to fully support UDP traffic. UDP listeners configured with the new `connection` format can now process datagrams through the plugin tree, enabling the same flexible middleware and terminator logic previously available only for TCP.
- **Added:** Implemented a dedicated `context` module (`src/modules/stack/transport/context.rs`) to centralize connection context initialization. This module strictly handles data peeking (TCP) or payload extraction (UDP) and populates the `KvStore` with standardized keys like `conn.proto` and `req.peek_buffer_hex`, adhering to the Single Responsibility Principle.
- **Changed:** Updated the `internal.transport.proxy.transparent` terminator plugin to support UDP connections. It now leverages a newly extracted `proxy_udp_direct` core function to handle UDP session management, NAT mapping, and bidirectional forwarding within the flow architecture.
- **Changed:** Refactored the UDP dispatch logic (`src/modules/stack/transport/proxy.rs`) to integrate with the Flow Engine. The dispatcher now dynamically branches execution between the legacy `protocols` list and the new `connection` tree based on the loaded configuration.

## 0.2.2 (26. Nov, 2025)

- **Added:** Implemented the core Flow Engine Executor (`src/modules/stack/transport/flow.rs`). This module recursively traverses the plugin tree, resolves `{{template}}` variables from the `KvStore`, executes `Middleware` and `Terminator` logic, and handles conditional branch routing.
- **Added:** Integrated the Flow Engine into the main TCP dispatcher. The system now intelligently peeks the initial connection payload, injects it into the `KvStore` (as `req.peek_buffer_hex`), and hands control to the new executor when a listener is configured with the `connection` format.
- **Fixed:** Resolved a critical runtime failure where the Flow Engine could not identify plugin types ("Plugin is neither a valid Middleware nor a Terminator"). This was due to Rust's inability to directly downcast `Box<dyn Plugin>` trait objects. The issue was fixed by adding safe `as_middleware` and `as_terminator` helper methods to the base `Plugin` trait.
- **Fixed:** Corrected the validation logic in `validator.rs` to utilize the new safe type coercion methods, ensuring that flow configurations are correctly validated against the plugin registry.

## 0.2.1 (26. Nov, 2025)

- **Changed:** Architecturally refactored the plugin registry into a dual-registry system. A static, immutable registry now safely houses all built-in plugins, while a new, atomically swappable (`ArcSwap`) registry has been introduced to support the future hot-reloading of external plugins.
- **Changed:** The global plugin lookup strategy (`get_plugin`) now prioritizes the internal registry, ensuring that core plugin functionality cannot be overridden by external plugins, thus enhancing system stability and security.
- **Fixed:** Corrected a series of critical compilation errors in the new flow-based configuration validator (`validator.rs`), primarily by replacing the direct `impl Validate` on an external type with a `#[validate(custom = "...")]` approach, thereby satisfying Rust's orphan rule.
- **Fixed:** Resolved a compilation failure in the plugin registry caused by a typo (`Lazy_new` instead of `Lazy::new`) during the initialization of static components.

## 0.2.0 (26. Nov, 2025)

- **Added:** Introduced a powerful, experimental flow-based processing engine as a new configuration format. Listeners can now be defined using a flexible, tree-like `connection` structure, enabling composable, multi-layer processing pipelines.
- **Added:** Architected a comprehensive plugin system, clearly distinguishing between `Middleware` (intermediate steps with named output branches) and `Terminator` (flow endpoints that finalize a connection).
- **Added:** Implemented a global, thread-safe Plugin Registry for dynamic lookup and validation of all built-in and future custom plugins.
- **Added:** Shipped the first set of internal plugins to power the new flow engine:
  - `internal.protocol.detect` (Middleware)
  - `internal.transport.abort` (Terminator)
  - `internal.transport.proxy.transparent` (Terminator)
- **Added:** Introduced a per-connection Key-Value store (`KvStore`) that attaches a unique context (UUID, source IP, etc.) to every connection, enabling stateful, context-aware processing across all plugin layers.
- **Changed:** **Architectural:** Refactored the core configuration models (`TcpConfig`, `UdpConfig`) into `enum`s. The system now seamlessly supports both the legacy `protocols` array and the new `connection` tree formats within the same listener file, ensuring full backward compatibility.
- **Changed:** The configuration validator (`validator.rs`) has been significantly enhanced to be dual-mode. It now includes a powerful, recursive validation engine for the new flow-based format, which cross-references the Plugin Registry to verify plugin names, required parameters, and data types at load time.
- **Changed:** Refactored the core L4 transparent proxy logic, extracting the TCP stream handling from `dispatcher.rs` into a reusable `proxy::proxy_tcp_stream` function. This function is now leveraged by both the legacy `forward` destination and the new `internal.transport.proxy.transparent` terminator plugin.
- **Changed:** The runtime dispatcher (`dispatcher.rs`) and UDP proxy (`proxy.rs`) are now aware of the dual-config format, branching their execution logic based on whether a listener is configured with `protocols` or a `connection` flow.
- **Fixed:** Resolved a fundamental architectural issue by introducing the `async-trait` crate. This makes the `Middleware` and `Terminator` plugin traits object-safe (`dyn Trait`), enabling their storage in a dynamic registry.
- **Fixed:** Corrected numerous compilation errors related to the `validator` crate, including fixing orphan rule violations by using a manual `impl Validate`, adding `#[validate(nested)]` where required, and using the correct error-handling APIs.
- **Fixed:** Addressed a wide range of compilation errors, including incorrect trait bounds (`PartialEq`, `Eq`), lifetime issues with static strings, and incorrect `lazy_static` pathing in derive macros, ensuring the codebase is fully compliant with the compiler.

## 0.1.16 (20. Nov, 2025)

- **Added:** Architecturally enhanced the connection handling pipeline by introducing a per-connection Key-Value store (`KvStore`). This foundational feature, managed by the new `modules/kv` module, automatically attaches essential metadata (`conn.uuid`, `conn.ip`, `conn.timestamp`, etc.) to every TCP and UDP connection upon creation, enabling advanced context-aware processing in future protocol layers.
- **Fixed:** Resolved a compilation error in the `kv` module by correcting the UUID generation method to `Uuid::now_v7`, which correctly uses the system's current time without requiring a manual timestamp argument.

## 0.1.15 (16. Nov, 2025)

- **Fixed:** The `nodes` configuration loader (`nodes/hotswap.rs`) now correctly recognizes both `.yml` and `.yaml` file extensions. This resolves a critical bug where a valid `nodes.yml` file was being ignored, causing the global node state to be empty and all `node:` type target resolutions to fail.
- **Changed:** Added more detailed debug logging to the node resolver (`resolver.rs`) to improve diagnostics when a node lookup fails.

## 0.1.14 (12. Nov, 2025)

- **Fixed:** Corrected a critical flaw in UDP mix-port forwarding where the session management mechanism was not protocol-aware. Previously, all datagrams from a single client IP:port were incorrectly locked to the backend of the first-matched protocol. The session key is now a composite of `(client_address, protocol_name)`, ensuring that different traffic types (e.g., DNS and QUIC) from the same client are correctly segregated and routed to their respective backends.
- **Changed:** The UDP session timeout is now configurable via the `UDP_SESSION_TIMEOUT_SECS` environment variable, defaulting to 30 seconds.

## 0.1.13 (11. Nov, 2025)

- **Fixed:** Corrected a critical deadlock in the UDP session handler (`proxy.rs`) that caused significant packet loss for traffic bursts from a single client. The session update logic could previously cause a lock contention, resulting in only the first packet of a sequence being proxied. The update mechanism is now fully atomic, ensuring reliable session affinity and correct handling of high-throughput UDP streams from a single source.

## 0.1.12 (11. Nov, 2025)

- **Fixed:** Corrected a flaw in the health-checking logic where a backend, once marked as "down" by a reactive connection failure, would not be automatically brought back into service by the periodic health checker. The state management in `health.rs` has been made more robust; the periodic checker now reliably overwrites the "unhealthy" status upon successful reconnection, ensuring that recovered backends are correctly returned to the active load-balancing pool.

## 0.1.11 (11. Nov, 2025)

- **Changed:** Enhanced the flexibility of the health-checking system (`health.rs`) by exposing its core timing parameters as environment variables. Operators can now fine-tune the TCP probe interval (`HEALTH_TCP_INTERVAL_SECS`), connection timeout (`HEALTH_TCP_CONNECT_TIMEOUT_MS`), and the UDP unhealthy target TTL (`HEALTH_UDP_UNHEALTHY_TTL_SECS`) without needing to recompile the application.
- **Fixed:** Resolved a significant TCP failover delay by implementing a reactive health-checking mechanism. Previously, the system would only detect a failed backend during its periodic health check cycle (every 5 seconds). Now, when a proxy connection attempt fails (e.g., `Connection refused`), the dispatcher immediately marks the target as unavailable. This ensures that subsequent traffic is instantly rerouted to healthy backends, dramatically improving reliability during runtime outages.

## 0.1.10 (10. Nov, 2025)

- **Fixed:** Resolved a critical bug in the file watcher (`requirements.rs`) where configuration changes in the `listener` directory were being ignored on macOS and other systems that use symbolic links for temporary directories (e.g., `/var` -> `/private/var`). The watcher now correctly canonicalizes paths before comparison, ensuring that hot-reloading for listeners is triggered reliably across all platforms.

## 0.1.9 (9. Nov, 2025)

- **Changed:** Architecturally refactored the L4 transport layer models (`src/modules/stack/transport/`) to enforce the Single Responsibility Principle. The original monolithic `model.rs` has been split into multiple, more focused files (`model.rs`, `tcp.rs`, `udp.rs`, `validator.rs`), significantly improving code organization and maintainability without introducing breaking changes to the configuration format.

## 0.1.8 (9. Nov, 2025)

- **Breaking:** Redesigned the forwarding target model (`Target`). It is now a flexible enum supporting `ip`, `domain`, or `node` types, requiring changes to all listener configuration files. For example, a target is now defined as `{ ip: "1.1.1.1", port: 80 }` or `{ domain: "example.com", port: 443 }`.
- **Added:** Integrated a new asynchronous DNS resolver module (`resolver.rs`) built upon `trust-dns-resolver`. This allows Vane to use domain names as backend targets and dynamically resolve them to IP addresses.
- **Changed:** The entire L4 proxy chain, including the health checker (`health.rs`) and load balancer (`balancer.rs`), has been refactored to be fully asynchronous. The balancer now resolves all `domain` and `node` targets into concrete IP addresses before applying health checks and balancing strategies.
- **Changed:** The health check mechanism is now resolver-aware. It periodically re-resolves all targets, enabling the system to automatically detect and adapt to changes in DNS records for `domain` targets and updates to the global `nodes` configuration.
- **Fixed:** Corrected a critical startup race condition. The bootstrap process now guarantees that the global `nodes` configuration is loaded before listener configurations, ensuring that `node`-type targets are always resolvable during initial health checks.

## 0.1.7 (9. Nov, 2025)

- **Added:** A new global `nodes` configuration system for service discovery. The application can now load a central list of named nodes from `nodes.yaml`, `nodes.json`, or `nodes.toml`.
- **Added:** Implemented a hot-swap mechanism for the `nodes` configuration. The application now watches the `nodes` file and reloads it automatically on change.
- **Changed:** The `nodes` data model has been redesigned to support a more flexible structure, allowing multiple IP configurations (with different ports and types) under a single named node.
- **Changed:** The application's file watcher has been re-architected to be context-aware. It now intelligently distinguishes between changes to `listener` configurations and the global `nodes` configuration, dispatching update signals to the correct modules.
- **Changed:** The IP address utility (`ip.rs`) has been refactore-d to use stable Rust methods for checking private IPv6 ranges, removing the dependency on [unstable](https://github.com/rust-lang/rust/issues/27709) nightly features.
- **Fixed:** Corrected a critical bug in the `nodes` loader where it would attempt to parse a file before checking for conflicts. The loader now correctly prioritizes the conflict check.
- **Fixed:** Resolved a compilation error by implementing the `Hash` trait for the `IpType` enum in the `nodes` data model.
- **Fixed:** Corrected a critical bug where the file watcher process would terminate prematurely, disabling all configuration hot-swap functionality.

## 0.1.6 (9. Nov, 2025)

- **Breaking:** The listener configuration directory structure has been changed. All port configurations (e.g., `[80]/`) must now reside within a `listener` subdirectory. The application will no longer scan the root config directory for listeners.
- **Changed:** The configuration hot-swap watcher is now context-aware. It only triggers a listener reload when changes are detected specifically within the `listener` subdirectory, improving efficiency.
- **Changed:** The application bootstrap process now ensures the `listener` configuration subdirectory exists on startup.

## 0.1.5 (9. Nov, 2025)

- **Breaking:** The `server` module has been fully restructured into a new `stack` architecture, separating protocol and transport layers for clearer layering and modularity.
- **Added:** Introduced L4–L7 layered directories (`l4`, `l5`, `l7`) to explicitly define network stack hierarchy.
- **Changed:** All protocol-related logic (`plain`, `quic`, `tls`) migrated under `stack/protocol`.
- **Changed:** Transport-related components (`balancer`, `proxy`, `session`) moved under `stack/transport`.
- **Changed:** Internal routing and module imports updated to reflect the new `stack` namespace.

## 0.1.4 (8. Nov, 2025)

- **Added:** Implemented full L4 UDP transparent proxy functionality, including a stateful session manager to maintain client-to-target affinity.
- **Added:** A new UDP session manager (`session.rs`) with a background cleanup task to prune idle sessions and enforce a configurable memory limit via `UDP_SESSION_BUFFER`.
- **Added:** A new IP utility (`ip.rs`) to apply different timeouts for private (`UDP_TIMEOUT_LOCAL`) versus public (`UDP_TIMEOUT_REMOTE`) upstream targets.
- **Changed:** The health checker now employs a reactive model for UDP, temporarily marking targets as unavailable on send failures.
- **Changed:** The load balancer has been updated to use the new reactive health status when selecting UDP targets.
- **Changed:** L4 proxy logic has been refactored into a dedicated `proxy.rs` module for better separation of concerns.
- **Fixed:** Corrected a critical bug where the UDP listener would not process any incoming datagrams due to an incorrect task structure.
- **Fixed:** The `prefix` detection method has been corrected to find a pattern anywhere within the initial data buffer, enabling proper detection of protocols like DNS.

## 0.1.3 (8. Nov, 2025)

- **Added:** A new `fallback` protocol detection method (`detect = { method = "fallback", pattern = "any" }`) to create unconditional catch-all rules, typically placed last in priority.
- **Added:** The configuration validator now enforces that the `pattern` for the `fallback` method must be `"any"`.
- **Changed:** The L4 dispatcher has been updated to correctly process the new `fallback` detection method.

## 0.1.2 (8. Nov, 2025)

- **Added:** A new `TCP_DETECT_LIMIT` environment variable (default: 64 bytes) to configure the size of the initial data buffer for L4 protocol detection, allowing for performance tuning.

## 0.1.1 (8. Nov, 2025)

- **Added:** Support for `regex` as a protocol detection method, allowing for more complex and precise matching of L4 traffic.
- **Changed:** The health check module has been refactored to distinguish between a blocking initial check and subsequent periodic checks.
- **Fixed:** Corrected a critical race condition in the application startup sequence. The initial health check now runs _after_ the configuration has been loaded, eliminating the initial window where all targets were considered unavailable.

## 0.1.0 (8. Nov, 2025)

- **Added:** Implemented full L4 TCP transparent proxy functionality. After protocol detection, connections are now forwarded to healthy backend targets.
- **Added:** A background health checker that periodically monitors the availability and latency of all configured `targets` and `fallbacks` via non-intrusive TCP connection tests.
- **Added:** A load balancer with three configurable strategies (`Random`, `Serial`, `Fastest`) to select the optimal backend target based on real-time health data.
- **Added:** The load balancer now seamlessly fails over to `fallback` targets if all primary `targets` are determined to be unavailable by the health checker.
- **Changed:** The L4 dispatcher is now fully integrated with the load balancer, selecting a healthy target for each new connection based on its configured strategy.
- **Changed:** The application bootstrap process now initializes and starts the global health checker as a persistent background task.

## 0.0.13 (8. Nov, 2025)

- **Added:** An L4 connection dispatcher (`l4/dispatcher.rs`) responsible for protocol detection. The dispatcher implements `magic` (byte matching) and `prefix` (string matching) detection methods by peeking at the initial TCP stream data.
- **Changed:** Refactored the application's state management to use a globally accessible, static `CONFIG_STATE` to provide tasks with direct, thread-safe access to the current listener configuration.
- **Changed:** The TCP listener task in `ports/tasks.rs` now delegates incoming connections to the new L4 dispatcher for protocol analysis and routing.
- **Changed:** Updated the log format for matched protocols to `⇅ [{priority}] Matched protocol {protocol} for connection from {ip:port}` for improved clarity.

## 0.0.12 (8. Nov, 2025)

- **Added:** A new `server::l4::fs` module now centralizes all filesystem operations for listener configurations.
- **Added:** A new `server::l4::loader` module, residing within the L4 feature module, now handles the parsing and validation of configuration files.
- **Changed:** Refactored the L4 configuration architecture for a clearer separation of concerns. All configuration file loading, parsing, and filesystem logic has been moved from the `ports` module into the `server::l4` module.
- **Changed:** The `ports` module is now streamlined to be exclusively responsible for the runtime management and lifecycle of network listeners.

## 0.0.11 (8. Nov, 2025)

- **Breaking:** Removed support for the RON (`.ron`) configuration format due to persistent parsing issues with its underlying library. The supported formats are now TOML, YAML, and JSON.
- **Fixed:** Corrected a critical data model deserialization bug in `TcpDestination` and `UdpDestination` that prevented the parsing of nested `forward` blocks in all configuration formats.
- **Fixed:** Resolved a TOML parsing error by adjusting the expected configuration structure to correctly handle inline tables for `forward` type destinations.

## 0.0.10 (8. Nov, 2025)

- **Added:** A comprehensive L4 configuration system with distinct models for TCP and UDP listeners, defined in `src/modules/server/l4/model.rs`.
- **Added:** Support for loading listener configurations in four formats: TOML, YAML, JSON, and RON. The system automatically detects and parses the correct format.
- **Added:** Advanced, multi-level validation for all configuration files using the `validator` crate. This includes checks for unique priorities, required fields, regex patterns for names, and custom logical rules (e.g., `session` blocks are only valid for `resolver` destinations).
- **Added:** A generic configuration loader (`loader.rs`) responsible for parsing, pre-processing (e.g., lowercasing names), and validating configuration files.
- **Changed:** The configuration hot-swap mechanism is now powered by the new loader. It performs a full validation and parsing of changed files, only starting/stopping listeners if the new configuration is valid.
- **Changed:** The application will now detect and log warnings for conflicting configuration files (e.g., `tcp.toml` and `tcp.json` in the same directory) and deactivate the listener for that port and protocol to ensure safety.
- **Changed:** The internal `PortStatus` model has been upgraded to hold the complete, parsed `TcpConfig` or `UdpConfig` for each listener, providing the live configuration to the rest of the application.

## 0.0.9 (8. Nov, 2025)

- **Changed:** The application startup sequence has been refined. Dynamic port listeners are now initialized _after_ the management console and network discovery have started, ensuring a cleaner and more logical boot order.
- **Changed:** Listener status logs (`UP`/`DOWN`) are now more descriptive, specifying whether the listener is binding to `IPv4` or dual-stack `IPv4 + IPv6`.
- **Fixed:** Corrected a critical bug where listeners configured at application startup were not being activated. The application now correctly scans and starts all required listeners when it first launches.

## 0.0.8 (8. Nov, 2025)

- **Added:** Implemented the core listener functionality. The application now actively binds to and listens on TCP and UDP ports as specified by the configuration files.
- **Added:** An asynchronous task manager to control the lifecycle of each network listener, spawning a dedicated Tokio task for each active protocol on a port.
- **Added:** A robust retry mechanism for port binding. If a port is already in use, the application will attempt to bind it again with an increasing backoff delay.
- **Added:** A global, thread-safe task registry (`DashMap`) to track the real-time state of all running listener tasks.
- **Added:** Listeners now support a graceful shutdown mechanism, entering a "draining" state to stop accepting new connections before terminating.
- **Changed:** The configuration hot-swap system is now fully connected to the task manager, starting and stopping live network listeners based on the detected file changes.
- **Changed:** Dynamic port listeners now respect the global `LISTEN_IPV6` environment variable, enabling binding to either IPv4-only or dual-stack IPv6 addresses.
- **Changed:** Refactored the `ports` module by splitting logic into `tasks.rs` (the workers), `listener.rs` (the manager), and `hotswap.rs` (the config link) for better separation of concerns.

## 0.0.7 (8. Nov, 2025)

- **Added:** A configuration hot-swap mechanism that automatically reloads listener settings when files in the config directory change.
- **Added:** The file watcher uses a 2-second debouncing period to ensure it only reloads after file operations have stabilized.
- **Added:** An in-memory, atomically swappable state (`ArcSwap`) now holds the live configuration of all ports, allowing for thread-safe reads and updates.
- **Added:** A new `GET /ports/{:port}` endpoint to retrieve the detailed live status (active state, protocols) of a single port from the in-memory state.
- **Added:** New endpoints `POST /ports/{:port}/{:protocol}` and `DELETE /ports/{:port}/{:protocol}` to manage individual TCP or UDP listeners for a port.
- **Changed:** The hot-swap logic now calculates a precise diff and logs declarative "UP" and "DOWN" messages for each listener that is added or removed.
- **Changed:** Application startup logic has been refactored into a `common/requirements.rs` module for better organization.
- **Fixed:** Corrected Axum router's state management by updating function signatures to `Router<PortState>` and using the `.with_state()` method properly during server initialization.

## 0.0.6 (8. Nov, 2025)

- **Added:** A new API endpoint group (`/ports`) for dynamically managing listener port configurations.
- **Added:** `GET /ports` to list all configured ports by scanning the configuration directory.
- **Added:** `POST /ports/{:port}` to create a new port listener by creating a corresponding `[<port>]` directory.
- **Added:** `DELETE /ports/{:port}` to remove a port listener by deleting its configuration directory.
- **Added:** A new request logging middleware that logs all incoming API calls, using `INFO` level for mutating requests (POST, DELETE) and `DEBUG` for read-only requests (GET).
- **Changed:** All API handlers now use the standardized JSON response format provided by the `response` module.
- **Changed:** Refactored API handler functions to follow a consistent naming convention (`{method}_{object}_handler`).

## 0.0.5 (8. Nov, 2025)

- **Added:** The management console now listens on a Unix domain socket (`/var/run/vane/console.sock` by default) in addition to the TCP port, configurable via the `SOCKET_DIR` environment variable.
- **Added:** Implemented automatic cleanup of the Unix socket file upon graceful shutdown.
- **Changed:** The server will now detect and remove a stale socket file from a previous run to prevent startup failures.
- **Fixed:** Refactored the graceful shutdown mechanism to use a central `tokio::sync::Notify`, resolving an issue where shutdown signals were processed multiple times, causing duplicate log messages.

## 0.0.4 (8. Nov, 2025)

- **Added:** A configuration management module (`getconf`) to handle config directory resolution and initialization.
- **Changed:** The application now automatically creates the configuration directory (`~/vane/` by default) and any necessary default config files on first run.

## 0.0.3 (8. Nov, 2025)

- **Added:** A utility module (`portool`) to validate network port numbers.
- **Added:** Configuration via `CONSOLE_LISTEN_IPV6` environment variable to enable api listening on IPv6 addresses.
- **Changed:** Refactored environment variable handling into a centralized `getenv` utility for improved reusability.
- **Changed:** Enhanced server startup logic to validate the listening port, with a fallback to a default value if the configured port is invalid.

## 0.0.2 (8. Nov, 2025)

- **Added:** Integrated `tokio` (async runtime with full + signal features) to handle concurrent tasks and graceful shutdown.
- **Added:** Introduced `axum` (v0.8 with macros) as the HTTP server framework for building management APIs.
- **Added:** Enabled structured serialization/deserialization using `serde` and `serde_json`.
- **Added:** Implemented environment variable loading via `dotenvy` for configuration management.
- **Added:** Added `shellexpand` to support automatic expansion of `~/` and environment paths.
- **Added:** Integrated `lazy-motd` for dynamic startup banner display.
- **Added:** Added timestamp handling with `chrono` (with serde support) for structured logging and API responses.
- **Added:** Unified and colorized startup log output using `fancy-log`.

## 0.0.1 (7. Nov, 2025)

- Initial release.
